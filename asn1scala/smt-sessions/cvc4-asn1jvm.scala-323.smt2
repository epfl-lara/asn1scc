; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6936 () Bool)

(assert start!6936)

(declare-fun b!33706 () Bool)

(declare-fun res!28899 () Bool)

(declare-fun e!22388 () Bool)

(assert (=> b!33706 (=> res!28899 e!22388)))

(declare-datatypes ((array!1872 0))(
  ( (array!1873 (arr!1303 (Array (_ BitVec 32) (_ BitVec 8))) (size!828 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1448 0))(
  ( (BitStream!1449 (buf!1156 array!1872) (currentByte!2523 (_ BitVec 32)) (currentBit!2518 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2511 0))(
  ( (Unit!2512) )
))
(declare-datatypes ((tuple2!3426 0))(
  ( (tuple2!3427 (_1!1800 Unit!2511) (_2!1800 BitStream!1448)) )
))
(declare-fun lt!49448 () tuple2!3426)

(declare-fun lt!49450 () tuple2!3426)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!33706 (= res!28899 (not (invariant!0 (currentBit!2518 (_2!1800 lt!49448)) (currentByte!2523 (_2!1800 lt!49448)) (size!828 (buf!1156 (_2!1800 lt!49450))))))))

(declare-fun e!22389 () Bool)

(declare-fun b!33707 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!49435 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!33707 (= e!22389 (= lt!49435 (bvsub (bvsub (bvadd (bitIndex!0 (size!828 (buf!1156 (_2!1800 lt!49448))) (currentByte!2523 (_2!1800 lt!49448)) (currentBit!2518 (_2!1800 lt!49448))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun srcBuffer!2 () array!1872)

(declare-fun b!33708 () Bool)

(declare-fun e!22387 () Bool)

(declare-datatypes ((tuple2!3428 0))(
  ( (tuple2!3429 (_1!1801 BitStream!1448) (_2!1801 BitStream!1448)) )
))
(declare-fun lt!49446 () tuple2!3428)

(declare-datatypes ((List!425 0))(
  ( (Nil!422) (Cons!421 (h!540 Bool) (t!1175 List!425)) )
))
(declare-fun head!262 (List!425) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1448 array!1872 (_ BitVec 64) (_ BitVec 64)) List!425)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1448 BitStream!1448 (_ BitVec 64)) List!425)

(assert (=> b!33708 (= e!22387 (= (head!262 (byteArrayBitContentToList!0 (_2!1800 lt!49448) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!262 (bitStreamReadBitsIntoList!0 (_2!1800 lt!49448) (_1!1801 lt!49446) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!33709 () Bool)

(declare-fun e!22392 () Bool)

(assert (=> b!33709 (= e!22392 e!22388)))

(declare-fun res!28908 () Bool)

(assert (=> b!33709 (=> res!28908 e!22388)))

(assert (=> b!33709 (= res!28908 (not (= (size!828 (buf!1156 (_2!1800 lt!49448))) (size!828 (buf!1156 (_2!1800 lt!49450))))))))

(assert (=> b!33709 e!22389))

(declare-fun res!28907 () Bool)

(assert (=> b!33709 (=> (not res!28907) (not e!22389))))

(declare-fun thiss!1379 () BitStream!1448)

(assert (=> b!33709 (= res!28907 (= (size!828 (buf!1156 (_2!1800 lt!49450))) (size!828 (buf!1156 thiss!1379))))))

(declare-fun b!33710 () Bool)

(declare-fun res!28895 () Bool)

(declare-fun e!22384 () Bool)

(assert (=> b!33710 (=> (not res!28895) (not e!22384))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!33710 (= res!28895 (validate_offset_bits!1 ((_ sign_extend 32) (size!828 (buf!1156 thiss!1379))) ((_ sign_extend 32) (currentByte!2523 thiss!1379)) ((_ sign_extend 32) (currentBit!2518 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!33711 () Bool)

(declare-fun e!22393 () Bool)

(declare-fun e!22390 () Bool)

(assert (=> b!33711 (= e!22393 e!22390)))

(declare-fun res!28894 () Bool)

(assert (=> b!33711 (=> res!28894 e!22390)))

(declare-fun isPrefixOf!0 (BitStream!1448 BitStream!1448) Bool)

(assert (=> b!33711 (= res!28894 (not (isPrefixOf!0 (_2!1800 lt!49448) (_2!1800 lt!49450))))))

(assert (=> b!33711 (isPrefixOf!0 thiss!1379 (_2!1800 lt!49450))))

(declare-fun lt!49445 () Unit!2511)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1448 BitStream!1448 BitStream!1448) Unit!2511)

(assert (=> b!33711 (= lt!49445 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1800 lt!49448) (_2!1800 lt!49450)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1448 array!1872 (_ BitVec 64) (_ BitVec 64)) tuple2!3426)

(assert (=> b!33711 (= lt!49450 (appendBitsMSBFirstLoop!0 (_2!1800 lt!49448) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!33711 e!22387))

(declare-fun res!28902 () Bool)

(assert (=> b!33711 (=> (not res!28902) (not e!22387))))

(assert (=> b!33711 (= res!28902 (validate_offset_bits!1 ((_ sign_extend 32) (size!828 (buf!1156 (_2!1800 lt!49448)))) ((_ sign_extend 32) (currentByte!2523 thiss!1379)) ((_ sign_extend 32) (currentBit!2518 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49449 () Unit!2511)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1448 array!1872 (_ BitVec 64)) Unit!2511)

(assert (=> b!33711 (= lt!49449 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1156 (_2!1800 lt!49448)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1448 BitStream!1448) tuple2!3428)

(assert (=> b!33711 (= lt!49446 (reader!0 thiss!1379 (_2!1800 lt!49448)))))

(declare-fun b!33712 () Bool)

(declare-fun e!22382 () Bool)

(assert (=> b!33712 (= e!22388 e!22382)))

(declare-fun res!28905 () Bool)

(assert (=> b!33712 (=> res!28905 e!22382)))

(assert (=> b!33712 (= res!28905 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!49440 () tuple2!3428)

(declare-fun lt!49439 () List!425)

(declare-fun lt!49436 () (_ BitVec 64))

(assert (=> b!33712 (= lt!49439 (bitStreamReadBitsIntoList!0 (_2!1800 lt!49450) (_1!1801 lt!49440) lt!49436))))

(declare-fun lt!49442 () List!425)

(declare-fun lt!49444 () tuple2!3428)

(assert (=> b!33712 (= lt!49442 (bitStreamReadBitsIntoList!0 (_2!1800 lt!49450) (_1!1801 lt!49444) (bvsub to!314 i!635)))))

(assert (=> b!33712 (validate_offset_bits!1 ((_ sign_extend 32) (size!828 (buf!1156 (_2!1800 lt!49450)))) ((_ sign_extend 32) (currentByte!2523 (_2!1800 lt!49448))) ((_ sign_extend 32) (currentBit!2518 (_2!1800 lt!49448))) lt!49436)))

(declare-fun lt!49441 () Unit!2511)

(assert (=> b!33712 (= lt!49441 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1800 lt!49448) (buf!1156 (_2!1800 lt!49450)) lt!49436))))

(assert (=> b!33712 (= lt!49440 (reader!0 (_2!1800 lt!49448) (_2!1800 lt!49450)))))

(assert (=> b!33712 (validate_offset_bits!1 ((_ sign_extend 32) (size!828 (buf!1156 (_2!1800 lt!49450)))) ((_ sign_extend 32) (currentByte!2523 thiss!1379)) ((_ sign_extend 32) (currentBit!2518 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!49434 () Unit!2511)

(assert (=> b!33712 (= lt!49434 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1156 (_2!1800 lt!49450)) (bvsub to!314 i!635)))))

(assert (=> b!33712 (= lt!49444 (reader!0 thiss!1379 (_2!1800 lt!49450)))))

(declare-fun b!33713 () Bool)

(declare-fun e!22383 () Bool)

(assert (=> b!33713 (= e!22383 e!22393)))

(declare-fun res!28898 () Bool)

(assert (=> b!33713 (=> res!28898 e!22393)))

(assert (=> b!33713 (= res!28898 (not (isPrefixOf!0 thiss!1379 (_2!1800 lt!49448))))))

(assert (=> b!33713 (validate_offset_bits!1 ((_ sign_extend 32) (size!828 (buf!1156 (_2!1800 lt!49448)))) ((_ sign_extend 32) (currentByte!2523 (_2!1800 lt!49448))) ((_ sign_extend 32) (currentBit!2518 (_2!1800 lt!49448))) lt!49436)))

(assert (=> b!33713 (= lt!49436 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!49438 () Unit!2511)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1448 BitStream!1448 (_ BitVec 64) (_ BitVec 64)) Unit!2511)

(assert (=> b!33713 (= lt!49438 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1800 lt!49448) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1448 (_ BitVec 8) (_ BitVec 32)) tuple2!3426)

(assert (=> b!33713 (= lt!49448 (appendBitFromByte!0 thiss!1379 (select (arr!1303 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!33714 () Bool)

(declare-fun res!28900 () Bool)

(assert (=> b!33714 (=> res!28900 e!22388)))

(assert (=> b!33714 (= res!28900 (not (invariant!0 (currentBit!2518 (_2!1800 lt!49448)) (currentByte!2523 (_2!1800 lt!49448)) (size!828 (buf!1156 (_2!1800 lt!49448))))))))

(declare-fun res!28896 () Bool)

(assert (=> start!6936 (=> (not res!28896) (not e!22384))))

(assert (=> start!6936 (= res!28896 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!828 srcBuffer!2))))))))

(assert (=> start!6936 e!22384))

(assert (=> start!6936 true))

(declare-fun array_inv!777 (array!1872) Bool)

(assert (=> start!6936 (array_inv!777 srcBuffer!2)))

(declare-fun e!22386 () Bool)

(declare-fun inv!12 (BitStream!1448) Bool)

(assert (=> start!6936 (and (inv!12 thiss!1379) e!22386)))

(declare-fun b!33715 () Bool)

(declare-fun res!28903 () Bool)

(assert (=> b!33715 (=> res!28903 e!22382)))

(declare-fun length!151 (List!425) Int)

(assert (=> b!33715 (= res!28903 (<= (length!151 lt!49442) 0))))

(declare-fun b!33716 () Bool)

(declare-fun res!28901 () Bool)

(assert (=> b!33716 (=> res!28901 e!22392)))

(assert (=> b!33716 (= res!28901 (not (= (size!828 (buf!1156 thiss!1379)) (size!828 (buf!1156 (_2!1800 lt!49450))))))))

(declare-fun b!33717 () Bool)

(assert (=> b!33717 (= e!22386 (array_inv!777 (buf!1156 thiss!1379)))))

(declare-fun b!33718 () Bool)

(declare-fun res!28904 () Bool)

(assert (=> b!33718 (=> res!28904 e!22392)))

(assert (=> b!33718 (= res!28904 (not (invariant!0 (currentBit!2518 (_2!1800 lt!49450)) (currentByte!2523 (_2!1800 lt!49450)) (size!828 (buf!1156 (_2!1800 lt!49450))))))))

(declare-fun b!33719 () Bool)

(assert (=> b!33719 (= e!22390 e!22392)))

(declare-fun res!28897 () Bool)

(assert (=> b!33719 (=> res!28897 e!22392)))

(declare-fun lt!49443 () (_ BitVec 64))

(assert (=> b!33719 (= res!28897 (not (= lt!49435 (bvsub (bvadd lt!49443 to!314) i!635))))))

(assert (=> b!33719 (= lt!49435 (bitIndex!0 (size!828 (buf!1156 (_2!1800 lt!49450))) (currentByte!2523 (_2!1800 lt!49450)) (currentBit!2518 (_2!1800 lt!49450))))))

(declare-fun b!33720 () Bool)

(assert (=> b!33720 (= e!22384 (not e!22383))))

(declare-fun res!28906 () Bool)

(assert (=> b!33720 (=> res!28906 e!22383)))

(assert (=> b!33720 (= res!28906 (bvsge i!635 to!314))))

(assert (=> b!33720 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!49437 () Unit!2511)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1448) Unit!2511)

(assert (=> b!33720 (= lt!49437 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!33720 (= lt!49443 (bitIndex!0 (size!828 (buf!1156 thiss!1379)) (currentByte!2523 thiss!1379) (currentBit!2518 thiss!1379)))))

(declare-fun b!33721 () Bool)

(assert (=> b!33721 (= e!22382 true)))

(declare-fun tail!142 (List!425) List!425)

(assert (=> b!33721 (= lt!49439 (tail!142 lt!49442))))

(declare-fun lt!49447 () Unit!2511)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1448 BitStream!1448 BitStream!1448 BitStream!1448 (_ BitVec 64) List!425) Unit!2511)

(assert (=> b!33721 (= lt!49447 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1800 lt!49450) (_2!1800 lt!49450) (_1!1801 lt!49444) (_1!1801 lt!49440) (bvsub to!314 i!635) lt!49442))))

(assert (= (and start!6936 res!28896) b!33710))

(assert (= (and b!33710 res!28895) b!33720))

(assert (= (and b!33720 (not res!28906)) b!33713))

(assert (= (and b!33713 (not res!28898)) b!33711))

(assert (= (and b!33711 res!28902) b!33708))

(assert (= (and b!33711 (not res!28894)) b!33719))

(assert (= (and b!33719 (not res!28897)) b!33718))

(assert (= (and b!33718 (not res!28904)) b!33716))

(assert (= (and b!33716 (not res!28901)) b!33709))

(assert (= (and b!33709 res!28907) b!33707))

(assert (= (and b!33709 (not res!28908)) b!33714))

(assert (= (and b!33714 (not res!28900)) b!33706))

(assert (= (and b!33706 (not res!28899)) b!33712))

(assert (= (and b!33712 (not res!28905)) b!33715))

(assert (= (and b!33715 (not res!28903)) b!33721))

(assert (= start!6936 b!33717))

(declare-fun m!50031 () Bool)

(assert (=> b!33712 m!50031))

(declare-fun m!50033 () Bool)

(assert (=> b!33712 m!50033))

(declare-fun m!50035 () Bool)

(assert (=> b!33712 m!50035))

(declare-fun m!50037 () Bool)

(assert (=> b!33712 m!50037))

(declare-fun m!50039 () Bool)

(assert (=> b!33712 m!50039))

(declare-fun m!50041 () Bool)

(assert (=> b!33712 m!50041))

(declare-fun m!50043 () Bool)

(assert (=> b!33712 m!50043))

(declare-fun m!50045 () Bool)

(assert (=> b!33712 m!50045))

(declare-fun m!50047 () Bool)

(assert (=> b!33718 m!50047))

(declare-fun m!50049 () Bool)

(assert (=> b!33710 m!50049))

(declare-fun m!50051 () Bool)

(assert (=> start!6936 m!50051))

(declare-fun m!50053 () Bool)

(assert (=> start!6936 m!50053))

(declare-fun m!50055 () Bool)

(assert (=> b!33713 m!50055))

(declare-fun m!50057 () Bool)

(assert (=> b!33713 m!50057))

(assert (=> b!33713 m!50057))

(declare-fun m!50059 () Bool)

(assert (=> b!33713 m!50059))

(declare-fun m!50061 () Bool)

(assert (=> b!33713 m!50061))

(declare-fun m!50063 () Bool)

(assert (=> b!33713 m!50063))

(declare-fun m!50065 () Bool)

(assert (=> b!33706 m!50065))

(declare-fun m!50067 () Bool)

(assert (=> b!33717 m!50067))

(declare-fun m!50069 () Bool)

(assert (=> b!33708 m!50069))

(assert (=> b!33708 m!50069))

(declare-fun m!50071 () Bool)

(assert (=> b!33708 m!50071))

(declare-fun m!50073 () Bool)

(assert (=> b!33708 m!50073))

(assert (=> b!33708 m!50073))

(declare-fun m!50075 () Bool)

(assert (=> b!33708 m!50075))

(declare-fun m!50077 () Bool)

(assert (=> b!33719 m!50077))

(declare-fun m!50079 () Bool)

(assert (=> b!33707 m!50079))

(declare-fun m!50081 () Bool)

(assert (=> b!33711 m!50081))

(declare-fun m!50083 () Bool)

(assert (=> b!33711 m!50083))

(declare-fun m!50085 () Bool)

(assert (=> b!33711 m!50085))

(declare-fun m!50087 () Bool)

(assert (=> b!33711 m!50087))

(declare-fun m!50089 () Bool)

(assert (=> b!33711 m!50089))

(declare-fun m!50091 () Bool)

(assert (=> b!33711 m!50091))

(declare-fun m!50093 () Bool)

(assert (=> b!33711 m!50093))

(declare-fun m!50095 () Bool)

(assert (=> b!33721 m!50095))

(declare-fun m!50097 () Bool)

(assert (=> b!33721 m!50097))

(declare-fun m!50099 () Bool)

(assert (=> b!33714 m!50099))

(declare-fun m!50101 () Bool)

(assert (=> b!33720 m!50101))

(declare-fun m!50103 () Bool)

(assert (=> b!33720 m!50103))

(declare-fun m!50105 () Bool)

(assert (=> b!33720 m!50105))

(declare-fun m!50107 () Bool)

(assert (=> b!33715 m!50107))

(push 1)

