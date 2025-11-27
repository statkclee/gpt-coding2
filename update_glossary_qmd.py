import yaml

def update_glossary_qmd():
    try:
        with open("glossary.yml", "r", encoding="utf-8") as f:
            glossary_data = yaml.safe_load(f)
    except FileNotFoundError:
        print("Error: glossary.yml not found.")
        return

    md_lines = [
        "---",
        "execute:",
        "  eval: false",
        "---",
        "",
        "# 용어사전 {#sec-glossary .unnumbered}",
        "",
        "프로그래밍과 컴퓨터 과학에서 사용되는 핵심 용어를 정리한다.",
        "",
        "| 용어 | 정의 |",
        "|:---|:---|"
    ]

    sorted_items = sorted(glossary_data.items(), key=lambda item: item[1]['name'])

    for key, value in sorted_items:
        term = value.get('name', key)
        definition = value.get('def', '')
        if definition is None: definition = ""
        
        definition = str(definition).replace("|", "&#124;").replace("\n", " ")
        md_lines.append(f"| {term} | {definition} |")

    with open("glossary.qmd", "w", encoding="utf-8") as f:
        f.write("\n".join(md_lines))

    print(f"Successfully updated glossary.qmd with {len(glossary_data)} terms.")

if __name__ == "__main__":
    update_glossary_qmd()
