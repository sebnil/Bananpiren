using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;

public class Buoyancy : MonoBehaviour {
	//The game object where we will display the mesh that is below the water
	public GameObject UnderwaterMeshOBJ;
	public float maxAngularVelocity;

    private GameObject waterPlane;
    private WaveGenerator waveGenerator;

	//The original Boat
	private Mesh BoatMesh;
	//These are always constant and comes from the original hull
	//Coordinates of all vertices 
	private Vector3[] originalVerticesArray;
	//Positions in allVerticesArray, such as 0, 3, 5, to build triangles
	private int[] originalTrianglesArray;

	//The part of the boat that's underwater
	private Mesh UnderWaterMesh;
	//These will be transformed to arrays later
	private List<Vector3> underwaterVertices;
	private List<int> underwaterTriangles;

	public float rho_water;
	public float rho_water_nominal;
	public float rho_water_big_angle;
	public float sinking_angle;

	public Rigidbody boatRB;
	public Transform boatTr;



	void Start() {
		UnderWaterMesh = UnderwaterMeshOBJ.GetComponent<MeshFilter>().mesh;
		BoatMesh = GetComponent<MeshFilter> ().mesh;

		if (boatRB == null) {
			boatRB = GetComponent<Rigidbody> ();
		}

		if (boatTr == null) {
			boatTr = GetComponent<Transform> ();
		}

		originalVerticesArray = BoatMesh.vertices;
		originalTrianglesArray = BoatMesh.triangles;

        waterPlane = GameObject.FindWithTag("WaterPlane");
        waveGenerator = waterPlane.GetComponent<WaveGenerator>();

		//Change this to stop the boat from oscillating
		boatRB.maxAngularVelocity = maxAngularVelocity;

		updateRho ();
	}

	void updateRho() {
		if (boatTr == null) {
			rho_water = rho_water_nominal;
		}
			
		if (Mathf.Abs(boatTr.localEulerAngles.z - 90) > sinking_angle) {
			rho_water = rho_water_big_angle;
		}
		else {
			rho_water = rho_water_nominal;
		}
	}


	void Update() {
		updateRho ();
		GenerateUnderwaterMesh();
	}

	//Will generate the mesh that's under the water
	//You can display the mesh, but it will float without it, we just need the data
	void GenerateUnderwaterMesh() {
		//These store the final data we need to create the mesh that's underwater
		underwaterVertices = new List<Vector3>();
		underwaterTriangles = new List<int>();


		//Loop through all the triangles (3 vertices at a time)
		int i = 0;
		while (i < originalTrianglesArray.Length) {
			//Find the distance from each vertice in the current triangle to the water
			//Negative distance means below water

			//The position of the vertice in Vector3 format (need to save this position for later)
			Vector3 vertice_1_pos = originalVerticesArray[originalTrianglesArray[i]];
			float? distance1 = DistanceToWater(vertice_1_pos);

			i++;

			Vector3 vertice_2_pos = originalVerticesArray[originalTrianglesArray[i]];
			float? distance2 = DistanceToWater(vertice_2_pos);

			i++;

			Vector3 vertice_3_pos = originalVerticesArray[originalTrianglesArray[i]];
			float? distance3 = DistanceToWater(vertice_3_pos);

			i++;


			//Continue to the next triangle if all triangles are above the water
			if (distance1 > 0f && distance2 > 0f && distance3 > 0f) {
				continue;
			}

			//Continue to the next triangle if there is no water
			if (distance1 == null || distance2 == null || distance3 == null) {
				continue;
			}

			//Sort the distances from high above water to low below water
			//Cant create these objects above or the sorting algorithm will complain about float? =
			Distance distance1OBJ = new Distance();
			Distance distance2OBJ = new Distance();
			Distance distance3OBJ = new Distance();

			distance1OBJ.distance = (float)distance1; // from float? to float
			distance1OBJ.name = "one";
			distance1OBJ.verticePos = vertice_1_pos;

			distance2OBJ.distance = (float)distance2;
			distance2OBJ.name = "two";
			distance2OBJ.verticePos = vertice_2_pos;

			distance3OBJ.distance = (float)distance3;
			distance3OBJ.name = "three";
			distance3OBJ.verticePos = vertice_3_pos;

			//Add the objects to a list so we can sort them
			List<Distance> allDistancesList = new List<Distance>();
			allDistancesList.Add(distance1OBJ);
			allDistancesList.Add(distance2OBJ);
			allDistancesList.Add(distance3OBJ);

			allDistancesList.Sort();
			allDistancesList.Reverse();

			//All vertices are underwater
			if (allDistancesList[0].distance < 0f && allDistancesList[1].distance < 0f && allDistancesList[2].distance < 0f) {
				//Make sure these coordinates are unsorted
				AddCoordinateToMesh(distance1OBJ.verticePos);				
				AddCoordinateToMesh(distance2OBJ.verticePos);				
				AddCoordinateToMesh(distance3OBJ.verticePos);
			}
			//One vertice is above the water, the rest is below
			else if (allDistancesList[0].distance > 0f && allDistancesList[1].distance < 0f && allDistancesList[2].distance < 0f) {
				//H is always at position 0
				Vector3 H = allDistancesList[0].verticePos;

				//Left of H is M
				//Right of H is L

				//Find the name of M
				string M_name = "temp";
				if (allDistancesList[0].name == "one") {
					M_name = "three";
				}
				else if (allDistancesList[0].name == "two") {
					M_name = "one";
				}
				else {
					M_name = "two";
				}

				//We also need the heights to water
				float h_H = allDistancesList[0].distance;
				float h_M = 0f;
				float h_L = 0f;

				Vector3 M = Vector3.zero;
				Vector3 L = Vector3.zero;

				//This means M is at position 1 in the List
				if (allDistancesList[1].name == M_name) {
					M = allDistancesList[1].verticePos;
					L = allDistancesList[2].verticePos;

					h_M = allDistancesList[1].distance;
					h_L = allDistancesList[2].distance;
				}
				else {
					M = allDistancesList[2].verticePos;
					L = allDistancesList[1].verticePos;

					h_M = allDistancesList[2].distance;
					h_L = allDistancesList[1].distance;
				}


				//Now we can calculate where we should cut the triangle to form 2 new triangles
				//because the resulting area will always form a square

				//Point I_M
				Vector3 MH = H - M;

				float t_M = -h_M / (h_H - h_M);

				Vector3 MI_M = t_M * MH;

				Vector3 I_M = MI_M + M;


				//Point I_L
				Vector3 LH = H - L;

				float t_L = -h_L / (h_H - h_L);

				Vector3 LI_L = t_L * LH;

				Vector3 I_L = LI_L + L;


				//Build the 2 new triangles
				AddCoordinateToMesh(M);
				AddCoordinateToMesh(I_M);
				AddCoordinateToMesh(I_L);

				AddCoordinateToMesh(M);
				AddCoordinateToMesh(I_L);
				AddCoordinateToMesh(L);
			}
			//Two vertices are above the water, the other is below
			else if (allDistancesList[0].distance > 0f && allDistancesList[1].distance > 0f && allDistancesList[2].distance < 0f) {
				//H and M are above the water
				//H is after the vertice that's below water, which is L
				//So we know which one is L because it is last in the sorted list
				Vector3 L = allDistancesList[2].verticePos;

				//Find the name of H
				string H_name = "temp";
				if (allDistancesList[2].name == "one") {
					H_name = "two";
				}
				else if (allDistancesList[2].name == "two") {
					H_name = "three";
				}
				else {
					H_name = "one";
				}


				//We also need the heights to water
				float h_L = allDistancesList[2].distance;
				float h_H = 0f;
				float h_M = 0f;

				Vector3 H = Vector3.zero;
				Vector3 M = Vector3.zero;

				//This means that H is at position 1 in the list
				if (allDistancesList[1].name == H_name) {
					H = allDistancesList[1].verticePos;
					M = allDistancesList[0].verticePos;

					h_H = allDistancesList[1].distance;
					h_M = allDistancesList[0].distance;
				}
				else {
					H = allDistancesList[0].verticePos;
					M = allDistancesList[1].verticePos;

					h_H = allDistancesList[0].distance;
					h_M = allDistancesList[1].distance;
				}


				//Now we can find where to cut the triangle

				//Point J_M
				Vector3 LM = M - L;

				float t_M = -h_L / (h_M - h_L);

				Vector3 LJ_M = t_M * LM;

				Vector3 J_M = LJ_M + L;


				//Point J_H
				Vector3 LH = H - L;

				float t_H = -h_L / (h_H - h_L);

				Vector3 LJ_H = t_H * LH;

				Vector3 J_H = LJ_H + L;


				//Create the triangle
				AddCoordinateToMesh(L);
				AddCoordinateToMesh(J_H);
				AddCoordinateToMesh(J_M);
			}
		}


		//Generate the final underwater mesh
		UnderWaterMesh.Clear();
		UnderWaterMesh.name = "Underwater Mesh";
		UnderWaterMesh.vertices = underwaterVertices.ToArray();
		//UnderWaterMesh.uv = uvs.ToArray();
		UnderWaterMesh.triangles = underwaterTriangles.ToArray();

		//Ensure the bounding volume is correct
		UnderWaterMesh.RecalculateBounds();
		//Update the normals to reflect the change
		UnderWaterMesh.RecalculateNormals();
	}

	//Find the distance from vertice to water
	//Positive if above water
	//Negative if below water
	float DistanceToWater(Vector3 position) {	
		//Calculate the coordinate of the vertice in global space
		Vector3 globalVerticePosition = transform.TransformPoint(position);

        //float y_pos = 0f;
        float waterHeight = waveGenerator.GetWaveYHeight(globalVerticePosition, Time.time);
        //float waterHeight = waveGenerator.GetWaveYHeight(position, Time.time);

        float distanceToWater = globalVerticePosition.y - waterHeight;
        //float distanceToWater = position.y - waterHeight;

        return distanceToWater;
	}

	//Help class to sort the distances
	//Requires "using System;" at the top
	public class Distance : IComparable<Distance> {
		//The distance to water
		public float distance;
		//We also need to store a name so we can form clockwise triangles
		public string name;
		//The Vector3 position of the vertice
		public Vector3 verticePos;

		public int CompareTo(Distance other) {
			return this.distance.CompareTo(other.distance);
		}
	}

	//Just adds one coordinate to the new mesh
	//we ignore if some triangles might share vertices
	void AddCoordinateToMesh(Vector3 coord) {
		underwaterVertices.Add(coord);
		underwaterTriangles.Add(underwaterVertices.Count - 1);
	}

	void FixedUpdate() {		
		if (underwaterTriangles == null) {
			return;
		}
		//Will add buoyance so it can float, and drifting from the waves
		if (underwaterTriangles.Count > 0) {
			AddForcesToBoat();
		}
	}

	//Will add buoyance so it can float, and drifting from the waves
	void AddForcesToBoat() {		
		int i = 0;
		while (i < underwaterTriangles.Count) {			
			//The position of the vertice in Vector3 format
			Vector3 vertice_1_pos = underwaterVertices[underwaterTriangles[i]];

			i++;

			Vector3 vertice_2_pos = underwaterVertices[underwaterTriangles[i]];

			i++;

			Vector3 vertice_3_pos = underwaterVertices[underwaterTriangles[i]];

			i++;

			//Calculate the center of the triangle
			Vector3 centerPoint = (vertice_1_pos + vertice_2_pos + vertice_3_pos) / 3f;


			//Calculate the distance to the surface from the center of the triangle
			//DistanceToWater() will transform to worldspace
			float distance_to_surface = Mathf.Abs((float)DistanceToWater(centerPoint));

			//From localspace to worldspace
			centerPoint   = transform.TransformPoint(centerPoint);
			vertice_1_pos = transform.TransformPoint(vertice_1_pos);
			vertice_2_pos = transform.TransformPoint(vertice_2_pos);
			vertice_3_pos = transform.TransformPoint(vertice_3_pos);


			//Calculate the normal to the triangle
			Vector3 crossProduct = Vector3.Cross(vertice_2_pos - vertice_1_pos, vertice_3_pos - vertice_1_pos).normalized;


			//Test that everything is working
			Debug.DrawRay(centerPoint, crossProduct * 3f);


			//Calculate the area of the triangle by using Heron's formula
			float a = Vector3.Distance(vertice_1_pos, vertice_2_pos);
			//float b = Vector3.Distance(vertice_2_pos, vertice_3_pos);
			float c = Vector3.Distance(vertice_3_pos, vertice_1_pos);

			//float s = (a + b + c) / 2f;

			//float area_heron = Mathf.Sqrt(s * (s-a) * (s-b) * (s-c));

			//Alternative 2 - area of triangle by using sinus
			float area_sin = (a * c * Mathf.Sin(Vector3.Angle(vertice_2_pos-vertice_1_pos, vertice_3_pos-vertice_1_pos) * Mathf.Deg2Rad)) / 2f;

			float area = area_sin;		


			//The buoyancy force
			AddBuoyancy(distance_to_surface, area, crossProduct, centerPoint);
		}
	}
	private void AddBuoyancy(float distance_to_surface, float area, Vector3 crossProduct, Vector3 centerPoint) {
		//The hydrostatic force dF = rho * g * z * dS * n
		// rho - density of water or whatever medium you have
		// g - gravity
		// z - distance to surface
		// dS - surface area
		// n - normal to the surface

		Vector3 F = rho_water * Physics.gravity.y * distance_to_surface * area * crossProduct;

		//The vertical component of the hydrostatic forces do not cancel out
		//This will cancel out the movement because of waves, which is good because
		//movement because of waves comes from another force, such as wave drift, and not buoyancy
		F = new Vector3(0f, F.y, 0f);

		//Should be in worldspace
		boatRB.AddForceAtPosition(F, centerPoint);
	}
}
