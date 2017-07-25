// Copyright 2016 Spin AG. For support contact assets@spin.de

using System.Collections.Generic;

public static class HashSetExtensions {

    /// <summary>
    /// Synchronizes the object (target [old]) with the parameter set (source [new]):
    /// - drops those in target not existing in the source
    /// - keeps values from those in target, existing in the source too
    /// - adds those existing in the source, but not existing in target
    /// Hint: imagine to get your client synchronized by the current state on the server
    /// </summary>
    public static void SynchronizeWith<T>(this HashSet<T> target, IEnumerable<T> source) {
        target.IntersectWith(source);
        target.UnionWith(source);
    }
}
