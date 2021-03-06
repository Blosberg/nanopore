
deBruijn_4="CCCCAGACGAGCACAACTGGGCGTAAGGCCTATACTCAAGAACACGTCGCCCTTCGAATGCCGTTTTCACTACATCTCCTGAAATAGCCAATTGCGCTGTCCACCTCTAGTATTTGGTACCGATTAGGGGTCTGCTCGTGTTGACCCGCATTCCGGATATGAGTTCTTGTGCAGCGGGAAGCTTACGGCAAAAGTGATGTAGAGGACTTTATCGGTTAACGCGACAGGTGGAGATCAGTCATAAACCATGGCTAATCCC"
deBruijn_5="CCCCCATCCGTAAGGTCCTATAATGTCGCCCTCTCCTTCATCAAGGCTTAAAACTTAGTGCCCGACTGGTTGTTCTTGGGATCAGAGCCCAGACGGCCTACCCAAACCTCGAGACTATGTTTAGACATATACCTAACCGATGATCCCCGGTGAAATAGAGATCGACCTGCTAAGCCGCGTCGGACAATAAGTCGATCTACATCGCAACTGTGGCGACAGGCCGTTCGCTATCGTGGTACCACAGTTTCTATTGTCTTTTTCGTTAGCCAAGTTGCGCCGAGTATTTGTGTTGGTCGTCCAATGGCCCCTGGCAGATTTACTGAAGGAGGTGGAAACGTCACATTTCACTAATTGCTTTCCCTTGTACACTGCGAGGGCACTCGCGCTTGCCTTACGACGTTTTAAGACCCGCACACGTACTTGATGCCATTATAGTAACTCCGCCAGTACGTGCTCGTATCCTGAGAATACTCAATTAGGTATGCGTAGAAGCTTCTCAGGGTGCGGAGTGGGGGTAGGCATTCCAGGATATTACAGCGGGAGAGGAAGTAGTTCCGAATTTTGAATCACGGGCTGACCAACAAGAACCCTAGTCTCGGGTCTGCCGGATGGGTTTGGAGCTCTGATACAAATCTGTATATGGATTGGCTACTAGGGGCCACTTTATCTCTAGCTGGACGATTCGGCGCAGCCTGTTATTCAGCTAGATGTAGCGTTGACACCGCTGTCCGGCAAGCGATAGCACCATGGTGTCAAAGATAACAGAAAAAGCAATCGGTTCAACGCGGCTCATAAACACAACCAGCAGGTTACCGGGGACCGTCTAAATGACTTCCTCCACCTTTGCAGTGTAAAGTGATTAACGAAAGGGAACATGTGACGCTCCCGTGAGCGCGAACGGAATGCTGCAAAATTCTGGGCGTGTGCATGAACTACGGTAATATCATTGAGGCGGTCAGTCATGCACGAGCATAGGACTCTTATGAGTTAATCCATACGCATCTTCGAAGAGTCCCACGCCTCACCCC"

BC1 = "CCCCGATTAGAT"
BC2 = "AGATGCGACCCC"
BC3 = "AGCCCTGATGCC"
BC4 = "CTGCCGACATTA"
BC5 = "CAAGCCCTTGAC"
BC6 = "ACGGATCGCCAG"
BC7 = "ACAAGAGCTGAT" 

# The plasmid contains (in this order):
# restriction seqTence1: 
# Debruijn sequence:
# barcode:
# restriction sequence2: "gcggccgc"
# 50xA = poly-A tail.

# Here is the actual plasmid with all restriction sequences and poly A tail:
"gggaccggu
CCCCCATCCGTAAGGTCCTATAATGTCGCCCTCTCCTTCATCAAGGCTTAAAACTTAGTGCCCGACTGGTTGTTCTTGGGATCAGAGCCCAGACGGCCTACCCAAACCTCGAGACTATGTTTAGACATATACCTAACCGATGATCCCCGGTGAAATAGAGATCGACCTGCTAAGCCGCGTCGGACAATAAGTCGATCTACATCGCAACTGTGGCGACAGGCCGTTCGCTATCGTGGTACCACAGTTTCTATTGTCTTTTTCGTTAGCCAAGTTGCGCCGAGTATTTGTGTTGGTCGTCCAATGGCCCCTGGCAGATTTACTGAAGGAGGTGGAAACGTCACATTTCACTAATTGCTTTCCCTTGTACACTGCGAGGGCACTCGCGCTTGCCTTACGACGTTTTAAGACCCGCACACGTACTTGATGCCATTATAGTAACTCCGCCAGTACGTGCTCGTATCCTGAGAATACTCAATTAGGTATGCGTAGAAGCTTCTCAGGGTGCGGAGTGGGGGTAGGCATTCCAGGATATTACAGCGGGAGAGGAAGTAGTTCCGAATTTTGAATCACGGGCTGACCAACAAGAACCCTAGTCTCGGGTCTGCCGGATGGGTTTGGAGCTCTGATACAAATCTGTATATGGATTGGCTACTAGGGGCCACTTTATCTCTAGCTGGACGATTCGGCGCAGCCTGTTATTCAGCTAGATGTAGCGTTGACACCGCTGTCCGGCAAGCGATAGCACCATGGTGTCAAAGATAACAGAAAAAGCAATCGGTTCAACGCGGCTCATAAACACAACCAGCAGGTTACCGGGGACCGTCTAAATGACTTCCTCCACCTTTGCAGTGTAAAGTGATTAACGAAAGGGAACATGTGACGCTCCCGTGAGCGCGAACGGAATGCTGCAAAATTCTGGGCGTGTGCATGAACTACGGTAATATCATTGAGGCGGTCAGTCATGCACGAGCATAGGACTCTTATGAGTTAATCCATACGCATCTTCGAAGAGTCCCACGCCTCACCCC
CCCCGATTAGAT
gcggccgc
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

# Determine the kmer diversity, or "coverage" that a given sequence exibits
get_kmer_divers <- function( seq_in = stop("GRanges must be provided"),
                             k      = stop("n must be provided")
                            )
  {
  N=nchar(seq_in)
  
  kmerset = list()
   
   for ( p in c(1:N-k+1))
     {
     kmerset[p]  <- substr( seq_in, p, p+k-1 )
     }
   
   kmerset_array <- unique( unlist( kmerset ) )
   
   return( kmerset_array)
  }
