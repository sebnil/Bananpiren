// Copyright 2016 Spin AG. For support contact assets@spin.de

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace Spin.Assetinator {

    public static class LogFileParser {

        // Since Unity 5.3.x the keyphrase was extended
        private const string UsedAssetsPattern =
            "^Used Assets( and files from the Resources folder)??, sorted by uncompressed size:$";
        private const string UserAssetsFolder = "Assets/";
        private static readonly Regex pathPrefixRegex =
            new Regex("^\\s+\\d+\\.\\d+\\s+[kmgt]?b\\s+(\\d+\\.\\d+|inf)%\\s+");

        private const char IdleDirectorySeparator = '/';

        public static List<string> GetUsedAssets(string logFilePath) {
            List<string> blockLines = null;

            using (var reader = new StreamReader(new FileStream(logFilePath, FileMode.Open,
                                FileAccess.Read, FileShare.ReadWrite))) {

                var regex = new Regex(UsedAssetsPattern);
                // search last of possible more builds in logfile
                while (!reader.EndOfStream) {
                    if (regex.IsMatch(reader.ReadLine())) {
                        blockLines = ReadBlock(reader);
                    }
                }

                if (blockLines == null) {
                    throw new InvalidOperationException();
                }
            }

            // Evaluate last build
            return GetPathsFrom(blockLines.GetEnumerator());
        }

        private static List<string> ReadBlock(StreamReader reader) {
            bool isUsedBlockOpen = true;
            var blockLines = new List<string>();

            while (!reader.EndOfStream) {
                string line = reader.ReadLine();
                if (line == string.Empty) {
                    isUsedBlockOpen = false;
                    break;
                }
                blockLines.Add(line);
            }

            if (isUsedBlockOpen) {
                throw new InvalidDataException();
            }
            return blockLines;
        }

        private static List<string> GetPathsFrom(IEnumerator<string> lines) {
            var paths = new HashSet<string>();

            // Find used AssetPaths
            while (lines.MoveNext() && pathPrefixRegex.IsMatch(lines.Current)) {
                string shortenedLine = pathPrefixRegex.Replace(lines.Current, string.Empty);
                paths.UnionWith(ParsePathHierachy(shortenedLine));
            }

            // Paranoia: exception if unexpected path after used block
            while (lines.MoveNext()) {
                if (pathPrefixRegex.IsMatch(lines.Current)) {
                    throw new InvalidDataException();
                }
            }
            return paths.ToList();
        }

        private static IEnumerable<string> ParsePathHierachy(string line) {
            if (line.StartsWith(UserAssetsFolder)) {
                yield return line;
                while (line.Contains(IdleDirectorySeparator)) {
                    int lastSeperatorIndex = line.LastIndexOf(IdleDirectorySeparator);
                    line = line.Remove(lastSeperatorIndex);
                    yield return line;
                }
            }
        }
    }
}
