sudo apt-get install -y vim
python -m pip install "huggingface_hub[cli]"
huggingface-cli download Tencent-Hunyuan/HunyuanDiT-v1.2 --local-dir ./ckpts
pip install -e ./IndexKits
wget -O ./dataset/data_demo.zip https://dit.hunyuan.tencent.com/download/HunyuanDiT/data_demo.zip
apt-get install unzip
unzip ./dataset/data_demo.zip -d ./dataset
mkdir ./dataset/porcelain/arrows ./dataset/porcelain/jsons
python ./hydit/data_loader/csv2arrow.py ./dataset/porcelain/csvfile/image_text.csv ./dataset/porcelain/arrows 1
huggingface-cli download Tencent-Hunyuan/Distillation-v1.2 --local-dir ./ckpts
mv ckpts/pytorch_model_distill.pt ./ckpts/t2i/model/

pip install deepspeed
pip install timm
pip install bitsandbytes

idk base -c dataset/yamls/porcelain.yaml -t dataset/porcelain/jsons/porcelain.json
idk multireso -c dataset/yamls/porcelain_mt.yaml -t dataset/porcelain/jsons/porcelain_mt.json