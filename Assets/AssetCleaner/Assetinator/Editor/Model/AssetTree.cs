// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Spin.Assetinator {

    public class AssetTree {
        private const string NoIgnoredAssetsText = "There are no ignored assets in the project.";
        private const string NoIdleAssetsText =
            "Your project has been assetinated.\nThere are no possible unused assets left.";
        private const string CantEvaluateBuildText = "Assetinator can't evaluate your last " +
            "build, because you changed your project. \nPlease make a new build.";

        public readonly AssetInfo Root;
        public HashSet<AssetInfo> Nodes { get; private set; }
        public bool IsOutdated { get; private set; }

        private readonly string searchFolder;
        private readonly AssetinatorSettings settings;

        private List<string> paths;
        private string errorMessage = ""; // empty string means: no error

        public AssetTree(string searchFolder, AssetinatorSettings settings) {
            this.searchFolder = searchFolder;
            this.settings = settings;

            Root = new AssetInfo(searchFolder, settings.Main);
            Nodes = new HashSet<AssetInfo>();
            paths = new List<string>();
        }

        public bool IsDefective {
            get { return !errorMessage.Equals(""); }
        }

        public bool IsEmpty(bool showIgnored) {
            return IsDefective || !Root.Children.Any() || !Root.HasToBeDisplayed(showIgnored);
        }

        public string GetEmptyTreeMessage(bool showIgnored) {
            if (IsDefective) {
                return errorMessage;
            }

            if (showIgnored) {
                return NoIgnoredAssetsText;
            }

            return IsOutdated ? CantEvaluateBuildText : NoIdleAssetsText;
        }

        public void Initialize(List<string> savedPaths = null) {
            paths = savedPaths ?? GetPaths();
            CreateNodes();
        }

        public void AdjustToLastBuild() {
            paths = GetPaths();
            IsOutdated = CreateNodes(rejectNew: true);
        }

        private bool CreateNodes(bool rejectNew = false) {
            // Can't simply replace existing treenodes, because foldout states would be forgotten.
            // So we are preparing the new tree in seedling and are merging the information.
            var seedling = new Seedling(Root, settings.Main);

            foreach (string path in paths) {
                seedling.AddBranch(path);
            }

            Nodes = seedling.MergeWith(Nodes, rejectNew);

            StoreCurrentPaths();

            return seedling.HasRemovedNodes;
        }

        private void StoreCurrentPaths() {
            var treePaths = new HashSet<string>(Nodes.Select(node => node.RelativePath));
            // don't use treePaths directly here as it may contain non idle parent paths needed
            // for rendering the tree
            settings.Temp.Paths = paths.Where(treePaths.Contains).ToList();
        }

        private List<string> GetPaths() {
            var result = new List<string>();
            try {
                result = AssetScanner.GetIdleAssetsPaths(PlatformSettings.LogFilePath, searchFolder);
                errorMessage = "";
            } catch (DirectoryNotFoundException e) {
                errorMessage = e.Message + " Please check the location of your log file.";
            } catch (FileNotFoundException e) {
                errorMessage = e.Message + " Please restart Unity.";
            } catch (System.InvalidOperationException) {
                errorMessage = "No build found in log file. Please build your project.";
            }
            return result;
        }
    }
}
