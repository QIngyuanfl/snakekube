mple = ['RCAR1', 'RCAR2', 'RCAR3', 'RCAR4', 'RCAR5', 'RCAR7','RCAR9', 'RCAR10', 'RMAR1']
rule all:
  input:
    expand('docker/{s}.gff', s = Sample)
rule orf_predict:
    input: "{Sample}/final_Scaftigs.fasta"
    output: "docker/{Sample}.gff"
    params:
        Translate_table = 11,
        Format = "gff",
        p = "meta"
    shell:
        '''
prodigal -i {input} -o {output} -f {params.Format} -g {params.Translate_table} -p {params.p} -q
        '''

