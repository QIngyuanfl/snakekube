workdir: '/'
sample = ['RCAR1', 'RCAR2', 'RCAR3', 'RCAR4', 'RCAR5', 'RCAR7','RCAR9', 'RCAR10', 'RMAR1']
rule all:
  input:
    expand('/project/RD/kubernetes/{s}.gff', s = sample)
rule orf_predict:
    input: "/project/RD/kubernetes/{sample}/final_Scaftigs.fasta"
    output: "/project/RD/kubernetes/{sample}.gff"
    params:
        Translate_table = 11,
        Format = "gff",
        p = "meta"
    shell:
        '''
/home/zhangqy/snakekube/src/snakekube -c "prodigal -i {input} -o {output} -f {params.Format} -g {params.Translate_table} -p {params.p} -q" -r 0.5Gi -s pvc-nas -m orf_predict:v1
        '''

