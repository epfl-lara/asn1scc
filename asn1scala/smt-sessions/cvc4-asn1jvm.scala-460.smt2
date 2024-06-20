; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!12772 () Bool)

(assert start!12772)

(declare-fun res!54308 () Bool)

(declare-fun e!43092 () Bool)

(assert (=> start!12772 (=> (not res!54308) (not e!43092))))

(declare-datatypes ((array!2837 0))(
  ( (array!2838 (arr!1870 (Array (_ BitVec 32) (_ BitVec 8))) (size!1306 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2837)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!12772 (= res!54308 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1306 srcBuffer!2))))))))

(assert (=> start!12772 e!43092))

(assert (=> start!12772 true))

(declare-fun array_inv!1185 (array!2837) Bool)

(assert (=> start!12772 (array_inv!1185 srcBuffer!2)))

(declare-datatypes ((BitStream!2252 0))(
  ( (BitStream!2253 (buf!1687 array!2837) (currentByte!3353 (_ BitVec 32)) (currentBit!3348 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2252)

(declare-fun e!43089 () Bool)

(declare-fun inv!12 (BitStream!2252) Bool)

(assert (=> start!12772 (and (inv!12 thiss!1379) e!43089)))

(declare-fun b!65470 () Bool)

(declare-fun res!54318 () Bool)

(declare-fun e!43094 () Bool)

(assert (=> b!65470 (=> res!54318 e!43094)))

(declare-datatypes ((List!701 0))(
  ( (Nil!698) (Cons!697 (h!816 Bool) (t!1451 List!701)) )
))
(declare-fun lt!103695 () List!701)

(declare-fun length!329 (List!701) Int)

(assert (=> b!65470 (= res!54318 (<= (length!329 lt!103695) 0))))

(declare-fun b!65471 () Bool)

(declare-fun res!54322 () Bool)

(assert (=> b!65471 (=> res!54322 e!43094)))

(declare-datatypes ((tuple2!5816 0))(
  ( (tuple2!5817 (_1!3019 BitStream!2252) (_2!3019 BitStream!2252)) )
))
(declare-fun lt!103683 () tuple2!5816)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65471 (= res!54322 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103683)))) ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103683))) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103683))) (bvsub to!314 i!635))))))

(declare-fun b!65472 () Bool)

(declare-fun res!54323 () Bool)

(assert (=> b!65472 (=> res!54323 e!43094)))

(declare-fun lt!103691 () tuple2!5816)

(declare-datatypes ((Unit!4425 0))(
  ( (Unit!4426) )
))
(declare-datatypes ((tuple2!5818 0))(
  ( (tuple2!5819 (_1!3020 Unit!4425) (_2!3020 BitStream!2252)) )
))
(declare-fun lt!103685 () tuple2!5818)

(declare-fun isPrefixOf!0 (BitStream!2252 BitStream!2252) Bool)

(assert (=> b!65472 (= res!54323 (not (isPrefixOf!0 (_1!3019 lt!103691) (_2!3020 lt!103685))))))

(declare-fun b!65473 () Bool)

(declare-fun e!43097 () Bool)

(declare-fun e!43087 () Bool)

(assert (=> b!65473 (= e!43097 e!43087)))

(declare-fun res!54320 () Bool)

(assert (=> b!65473 (=> res!54320 e!43087)))

(declare-fun lt!103688 () (_ BitVec 64))

(declare-fun lt!103681 () (_ BitVec 64))

(assert (=> b!65473 (= res!54320 (not (= lt!103681 (bvsub (bvadd lt!103688 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!65473 (= lt!103681 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103685))) (currentByte!3353 (_2!3020 lt!103685)) (currentBit!3348 (_2!3020 lt!103685))))))

(declare-fun b!65474 () Bool)

(declare-fun e!43093 () Bool)

(declare-fun e!43090 () Bool)

(assert (=> b!65474 (= e!43093 e!43090)))

(declare-fun res!54311 () Bool)

(assert (=> b!65474 (=> res!54311 e!43090)))

(declare-fun lt!103684 () tuple2!5818)

(assert (=> b!65474 (= res!54311 (not (isPrefixOf!0 thiss!1379 (_2!3020 lt!103684))))))

(declare-fun lt!103686 () (_ BitVec 64))

(assert (=> b!65474 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) lt!103686)))

(assert (=> b!65474 (= lt!103686 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103696 () Unit!4425)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2252 BitStream!2252 (_ BitVec 64) (_ BitVec 64)) Unit!4425)

(assert (=> b!65474 (= lt!103696 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3020 lt!103684) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2252 (_ BitVec 8) (_ BitVec 32)) tuple2!5818)

(assert (=> b!65474 (= lt!103684 (appendBitFromByte!0 thiss!1379 (select (arr!1870 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!65475 () Bool)

(declare-fun res!54321 () Bool)

(assert (=> b!65475 (=> res!54321 e!43094)))

(assert (=> b!65475 (= res!54321 (not (isPrefixOf!0 (_1!3019 lt!103683) (_2!3020 lt!103685))))))

(declare-fun b!65476 () Bool)

(declare-fun res!54316 () Bool)

(assert (=> b!65476 (=> res!54316 e!43094)))

(assert (=> b!65476 (= res!54316 (or (not (= (buf!1687 (_1!3019 lt!103683)) (buf!1687 (_1!3019 lt!103691)))) (not (= (buf!1687 (_1!3019 lt!103683)) (buf!1687 (_2!3020 lt!103685)))) (bvsge lt!103681 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!65477 () Bool)

(declare-fun res!54314 () Bool)

(assert (=> b!65477 (=> (not res!54314) (not e!43092))))

(assert (=> b!65477 (= res!54314 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 thiss!1379))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!65478 () Bool)

(declare-fun res!54304 () Bool)

(declare-fun e!43091 () Bool)

(assert (=> b!65478 (=> res!54304 e!43091)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!65478 (= res!54304 (not (invariant!0 (currentBit!3348 (_2!3020 lt!103684)) (currentByte!3353 (_2!3020 lt!103684)) (size!1306 (buf!1687 (_2!3020 lt!103685))))))))

(declare-fun b!65479 () Bool)

(declare-fun res!54309 () Bool)

(assert (=> b!65479 (=> res!54309 e!43087)))

(assert (=> b!65479 (= res!54309 (not (invariant!0 (currentBit!3348 (_2!3020 lt!103685)) (currentByte!3353 (_2!3020 lt!103685)) (size!1306 (buf!1687 (_2!3020 lt!103685))))))))

(declare-fun b!65480 () Bool)

(assert (=> b!65480 (= e!43087 e!43091)))

(declare-fun res!54315 () Bool)

(assert (=> b!65480 (=> res!54315 e!43091)))

(assert (=> b!65480 (= res!54315 (not (= (size!1306 (buf!1687 (_2!3020 lt!103684))) (size!1306 (buf!1687 (_2!3020 lt!103685))))))))

(declare-fun e!43096 () Bool)

(assert (=> b!65480 e!43096))

(declare-fun res!54317 () Bool)

(assert (=> b!65480 (=> (not res!54317) (not e!43096))))

(assert (=> b!65480 (= res!54317 (= (size!1306 (buf!1687 (_2!3020 lt!103685))) (size!1306 (buf!1687 thiss!1379))))))

(declare-fun b!65481 () Bool)

(assert (=> b!65481 (= e!43090 e!43097)))

(declare-fun res!54305 () Bool)

(assert (=> b!65481 (=> res!54305 e!43097)))

(assert (=> b!65481 (= res!54305 (not (isPrefixOf!0 (_2!3020 lt!103684) (_2!3020 lt!103685))))))

(assert (=> b!65481 (isPrefixOf!0 thiss!1379 (_2!3020 lt!103685))))

(declare-fun lt!103687 () Unit!4425)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2252 BitStream!2252 BitStream!2252) Unit!4425)

(assert (=> b!65481 (= lt!103687 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3020 lt!103684) (_2!3020 lt!103685)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2252 array!2837 (_ BitVec 64) (_ BitVec 64)) tuple2!5818)

(assert (=> b!65481 (= lt!103685 (appendBitsMSBFirstLoop!0 (_2!3020 lt!103684) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!43095 () Bool)

(assert (=> b!65481 e!43095))

(declare-fun res!54324 () Bool)

(assert (=> b!65481 (=> (not res!54324) (not e!43095))))

(assert (=> b!65481 (= res!54324 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103692 () Unit!4425)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2252 array!2837 (_ BitVec 64)) Unit!4425)

(assert (=> b!65481 (= lt!103692 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1687 (_2!3020 lt!103684)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!103693 () tuple2!5816)

(declare-fun reader!0 (BitStream!2252 BitStream!2252) tuple2!5816)

(assert (=> b!65481 (= lt!103693 (reader!0 thiss!1379 (_2!3020 lt!103684)))))

(declare-fun b!65482 () Bool)

(assert (=> b!65482 (= e!43094 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103691)))) ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103691))) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103691))) lt!103686))))

(declare-fun b!65483 () Bool)

(declare-fun res!54306 () Bool)

(assert (=> b!65483 (=> res!54306 e!43087)))

(assert (=> b!65483 (= res!54306 (not (= (size!1306 (buf!1687 thiss!1379)) (size!1306 (buf!1687 (_2!3020 lt!103685))))))))

(declare-fun b!65484 () Bool)

(assert (=> b!65484 (= e!43091 e!43094)))

(declare-fun res!54319 () Bool)

(assert (=> b!65484 (=> res!54319 e!43094)))

(assert (=> b!65484 (= res!54319 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103682 () List!701)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2252 BitStream!2252 (_ BitVec 64)) List!701)

(assert (=> b!65484 (= lt!103682 (bitStreamReadBitsIntoList!0 (_2!3020 lt!103685) (_1!3019 lt!103691) lt!103686))))

(assert (=> b!65484 (= lt!103695 (bitStreamReadBitsIntoList!0 (_2!3020 lt!103685) (_1!3019 lt!103683) (bvsub to!314 i!635)))))

(assert (=> b!65484 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) lt!103686)))

(declare-fun lt!103689 () Unit!4425)

(assert (=> b!65484 (= lt!103689 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3020 lt!103684) (buf!1687 (_2!3020 lt!103685)) lt!103686))))

(assert (=> b!65484 (= lt!103691 (reader!0 (_2!3020 lt!103684) (_2!3020 lt!103685)))))

(assert (=> b!65484 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!103694 () Unit!4425)

(assert (=> b!65484 (= lt!103694 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1687 (_2!3020 lt!103685)) (bvsub to!314 i!635)))))

(assert (=> b!65484 (= lt!103683 (reader!0 thiss!1379 (_2!3020 lt!103685)))))

(declare-fun b!65485 () Bool)

(assert (=> b!65485 (= e!43096 (= lt!103681 (bvsub (bvsub (bvadd (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!65486 () Bool)

(declare-fun head!520 (List!701) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2252 array!2837 (_ BitVec 64) (_ BitVec 64)) List!701)

(assert (=> b!65486 (= e!43095 (= (head!520 (byteArrayBitContentToList!0 (_2!3020 lt!103684) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!520 (bitStreamReadBitsIntoList!0 (_2!3020 lt!103684) (_1!3019 lt!103693) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!65487 () Bool)

(assert (=> b!65487 (= e!43089 (array_inv!1185 (buf!1687 thiss!1379)))))

(declare-fun b!65488 () Bool)

(assert (=> b!65488 (= e!43092 (not e!43093))))

(declare-fun res!54310 () Bool)

(assert (=> b!65488 (=> res!54310 e!43093)))

(assert (=> b!65488 (= res!54310 (bvsge i!635 to!314))))

(assert (=> b!65488 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!103690 () Unit!4425)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2252) Unit!4425)

(assert (=> b!65488 (= lt!103690 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!65488 (= lt!103688 (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)))))

(declare-fun b!65489 () Bool)

(declare-fun res!54312 () Bool)

(assert (=> b!65489 (=> res!54312 e!43094)))

(assert (=> b!65489 (= res!54312 (not (isPrefixOf!0 (_1!3019 lt!103683) (_1!3019 lt!103691))))))

(declare-fun b!65490 () Bool)

(declare-fun res!54307 () Bool)

(assert (=> b!65490 (=> res!54307 e!43091)))

(assert (=> b!65490 (= res!54307 (not (invariant!0 (currentBit!3348 (_2!3020 lt!103684)) (currentByte!3353 (_2!3020 lt!103684)) (size!1306 (buf!1687 (_2!3020 lt!103684))))))))

(declare-fun b!65491 () Bool)

(declare-fun res!54313 () Bool)

(assert (=> b!65491 (=> res!54313 e!43094)))

(assert (=> b!65491 (= res!54313 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103683))) (currentByte!3353 (_1!3019 lt!103683)) (currentBit!3348 (_1!3019 lt!103683)))) (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103691))) (currentByte!3353 (_1!3019 lt!103691)) (currentBit!3348 (_1!3019 lt!103691))))))))

(assert (= (and start!12772 res!54308) b!65477))

(assert (= (and b!65477 res!54314) b!65488))

(assert (= (and b!65488 (not res!54310)) b!65474))

(assert (= (and b!65474 (not res!54311)) b!65481))

(assert (= (and b!65481 res!54324) b!65486))

(assert (= (and b!65481 (not res!54305)) b!65473))

(assert (= (and b!65473 (not res!54320)) b!65479))

(assert (= (and b!65479 (not res!54309)) b!65483))

(assert (= (and b!65483 (not res!54306)) b!65480))

(assert (= (and b!65480 res!54317) b!65485))

(assert (= (and b!65480 (not res!54315)) b!65490))

(assert (= (and b!65490 (not res!54307)) b!65478))

(assert (= (and b!65478 (not res!54304)) b!65484))

(assert (= (and b!65484 (not res!54319)) b!65470))

(assert (= (and b!65470 (not res!54318)) b!65475))

(assert (= (and b!65475 (not res!54321)) b!65472))

(assert (= (and b!65472 (not res!54323)) b!65489))

(assert (= (and b!65489 (not res!54312)) b!65476))

(assert (= (and b!65476 (not res!54316)) b!65491))

(assert (= (and b!65491 (not res!54313)) b!65471))

(assert (= (and b!65471 (not res!54322)) b!65482))

(assert (= start!12772 b!65487))

(declare-fun m!103935 () Bool)

(assert (=> b!65475 m!103935))

(declare-fun m!103937 () Bool)

(assert (=> b!65489 m!103937))

(declare-fun m!103939 () Bool)

(assert (=> b!65479 m!103939))

(declare-fun m!103941 () Bool)

(assert (=> b!65481 m!103941))

(declare-fun m!103943 () Bool)

(assert (=> b!65481 m!103943))

(declare-fun m!103945 () Bool)

(assert (=> b!65481 m!103945))

(declare-fun m!103947 () Bool)

(assert (=> b!65481 m!103947))

(declare-fun m!103949 () Bool)

(assert (=> b!65481 m!103949))

(declare-fun m!103951 () Bool)

(assert (=> b!65481 m!103951))

(declare-fun m!103953 () Bool)

(assert (=> b!65481 m!103953))

(declare-fun m!103955 () Bool)

(assert (=> b!65491 m!103955))

(declare-fun m!103957 () Bool)

(assert (=> b!65491 m!103957))

(declare-fun m!103959 () Bool)

(assert (=> b!65486 m!103959))

(assert (=> b!65486 m!103959))

(declare-fun m!103961 () Bool)

(assert (=> b!65486 m!103961))

(declare-fun m!103963 () Bool)

(assert (=> b!65486 m!103963))

(assert (=> b!65486 m!103963))

(declare-fun m!103965 () Bool)

(assert (=> b!65486 m!103965))

(declare-fun m!103967 () Bool)

(assert (=> b!65471 m!103967))

(declare-fun m!103969 () Bool)

(assert (=> b!65490 m!103969))

(declare-fun m!103971 () Bool)

(assert (=> b!65478 m!103971))

(declare-fun m!103973 () Bool)

(assert (=> b!65472 m!103973))

(declare-fun m!103975 () Bool)

(assert (=> b!65470 m!103975))

(declare-fun m!103977 () Bool)

(assert (=> b!65474 m!103977))

(declare-fun m!103979 () Bool)

(assert (=> b!65474 m!103979))

(declare-fun m!103981 () Bool)

(assert (=> b!65474 m!103981))

(declare-fun m!103983 () Bool)

(assert (=> b!65474 m!103983))

(declare-fun m!103985 () Bool)

(assert (=> b!65474 m!103985))

(assert (=> b!65474 m!103981))

(declare-fun m!103987 () Bool)

(assert (=> b!65477 m!103987))

(declare-fun m!103989 () Bool)

(assert (=> b!65482 m!103989))

(declare-fun m!103991 () Bool)

(assert (=> b!65485 m!103991))

(declare-fun m!103993 () Bool)

(assert (=> b!65484 m!103993))

(declare-fun m!103995 () Bool)

(assert (=> b!65484 m!103995))

(declare-fun m!103997 () Bool)

(assert (=> b!65484 m!103997))

(declare-fun m!103999 () Bool)

(assert (=> b!65484 m!103999))

(declare-fun m!104001 () Bool)

(assert (=> b!65484 m!104001))

(declare-fun m!104003 () Bool)

(assert (=> b!65484 m!104003))

(declare-fun m!104005 () Bool)

(assert (=> b!65484 m!104005))

(declare-fun m!104007 () Bool)

(assert (=> b!65484 m!104007))

(declare-fun m!104009 () Bool)

(assert (=> b!65488 m!104009))

(declare-fun m!104011 () Bool)

(assert (=> b!65488 m!104011))

(declare-fun m!104013 () Bool)

(assert (=> b!65488 m!104013))

(declare-fun m!104015 () Bool)

(assert (=> b!65473 m!104015))

(declare-fun m!104017 () Bool)

(assert (=> b!65487 m!104017))

(declare-fun m!104019 () Bool)

(assert (=> start!12772 m!104019))

(declare-fun m!104021 () Bool)

(assert (=> start!12772 m!104021))

(push 1)

(assert (not b!65482))

(assert (not b!65474))

(assert (not b!65489))

(assert (not b!65472))

(assert (not b!65471))

(assert (not b!65475))

(assert (not b!65477))

(assert (not b!65484))

(assert (not b!65473))

(assert (not b!65488))

(assert (not b!65487))

(assert (not b!65470))

(assert (not b!65485))

(assert (not b!65478))

(assert (not start!12772))

(assert (not b!65491))

(assert (not b!65479))

(assert (not b!65486))

(assert (not b!65481))

(assert (not b!65490))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!20536 () Bool)

(assert (=> d!20536 (= (array_inv!1185 (buf!1687 thiss!1379)) (bvsge (size!1306 (buf!1687 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!65487 d!20536))

(declare-fun d!20540 () Bool)

(assert (=> d!20540 (= (head!520 (byteArrayBitContentToList!0 (_2!3020 lt!103684) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!816 (byteArrayBitContentToList!0 (_2!3020 lt!103684) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!65486 d!20540))

(declare-fun d!20542 () Bool)

(declare-fun c!4743 () Bool)

(assert (=> d!20542 (= c!4743 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43148 () List!701)

(assert (=> d!20542 (= (byteArrayBitContentToList!0 (_2!3020 lt!103684) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!43148)))

(declare-fun b!65578 () Bool)

(assert (=> b!65578 (= e!43148 Nil!698)))

(declare-fun b!65579 () Bool)

(assert (=> b!65579 (= e!43148 (Cons!697 (not (= (bvand ((_ sign_extend 24) (select (arr!1870 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3020 lt!103684) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!20542 c!4743) b!65578))

(assert (= (and d!20542 (not c!4743)) b!65579))

(assert (=> b!65579 m!103981))

(declare-fun m!104093 () Bool)

(assert (=> b!65579 m!104093))

(declare-fun m!104095 () Bool)

(assert (=> b!65579 m!104095))

(assert (=> b!65486 d!20542))

(declare-fun d!20546 () Bool)

(assert (=> d!20546 (= (head!520 (bitStreamReadBitsIntoList!0 (_2!3020 lt!103684) (_1!3019 lt!103693) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!816 (bitStreamReadBitsIntoList!0 (_2!3020 lt!103684) (_1!3019 lt!103693) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!65486 d!20546))

(declare-datatypes ((tuple2!5828 0))(
  ( (tuple2!5829 (_1!3025 Bool) (_2!3025 BitStream!2252)) )
))
(declare-fun lt!103807 () tuple2!5828)

(declare-fun lt!103806 () (_ BitVec 64))

(declare-fun b!65602 () Bool)

(declare-datatypes ((tuple2!5830 0))(
  ( (tuple2!5831 (_1!3026 List!701) (_2!3026 BitStream!2252)) )
))
(declare-fun e!43161 () tuple2!5830)

(assert (=> b!65602 (= e!43161 (tuple2!5831 (Cons!697 (_1!3025 lt!103807) (bitStreamReadBitsIntoList!0 (_2!3020 lt!103684) (_2!3025 lt!103807) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!103806))) (_2!3025 lt!103807)))))

(declare-fun readBit!0 (BitStream!2252) tuple2!5828)

(assert (=> b!65602 (= lt!103807 (readBit!0 (_1!3019 lt!103693)))))

(assert (=> b!65602 (= lt!103806 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!65604 () Bool)

(declare-fun e!43160 () Bool)

(declare-fun lt!103805 () List!701)

(assert (=> b!65604 (= e!43160 (> (length!329 lt!103805) 0))))

(declare-fun b!65601 () Bool)

(assert (=> b!65601 (= e!43161 (tuple2!5831 Nil!698 (_1!3019 lt!103693)))))

(declare-fun b!65603 () Bool)

(declare-fun isEmpty!205 (List!701) Bool)

(assert (=> b!65603 (= e!43160 (isEmpty!205 lt!103805))))

(declare-fun d!20548 () Bool)

(assert (=> d!20548 e!43160))

(declare-fun c!4748 () Bool)

(assert (=> d!20548 (= c!4748 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20548 (= lt!103805 (_1!3026 e!43161))))

(declare-fun c!4749 () Bool)

(assert (=> d!20548 (= c!4749 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20548 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20548 (= (bitStreamReadBitsIntoList!0 (_2!3020 lt!103684) (_1!3019 lt!103693) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103805)))

(assert (= (and d!20548 c!4749) b!65601))

(assert (= (and d!20548 (not c!4749)) b!65602))

(assert (= (and d!20548 c!4748) b!65603))

(assert (= (and d!20548 (not c!4748)) b!65604))

(declare-fun m!104111 () Bool)

(assert (=> b!65602 m!104111))

(declare-fun m!104113 () Bool)

(assert (=> b!65602 m!104113))

(declare-fun m!104115 () Bool)

(assert (=> b!65604 m!104115))

(declare-fun m!104117 () Bool)

(assert (=> b!65603 m!104117))

(assert (=> b!65486 d!20548))

(declare-fun d!20560 () Bool)

(declare-fun res!54407 () Bool)

(declare-fun e!43167 () Bool)

(assert (=> d!20560 (=> (not res!54407) (not e!43167))))

(assert (=> d!20560 (= res!54407 (= (size!1306 (buf!1687 (_1!3019 lt!103683))) (size!1306 (buf!1687 (_2!3020 lt!103685)))))))

(assert (=> d!20560 (= (isPrefixOf!0 (_1!3019 lt!103683) (_2!3020 lt!103685)) e!43167)))

(declare-fun b!65611 () Bool)

(declare-fun res!54409 () Bool)

(assert (=> b!65611 (=> (not res!54409) (not e!43167))))

(assert (=> b!65611 (= res!54409 (bvsle (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103683))) (currentByte!3353 (_1!3019 lt!103683)) (currentBit!3348 (_1!3019 lt!103683))) (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103685))) (currentByte!3353 (_2!3020 lt!103685)) (currentBit!3348 (_2!3020 lt!103685)))))))

(declare-fun b!65612 () Bool)

(declare-fun e!43166 () Bool)

(assert (=> b!65612 (= e!43167 e!43166)))

(declare-fun res!54408 () Bool)

(assert (=> b!65612 (=> res!54408 e!43166)))

(assert (=> b!65612 (= res!54408 (= (size!1306 (buf!1687 (_1!3019 lt!103683))) #b00000000000000000000000000000000))))

(declare-fun b!65613 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2837 array!2837 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65613 (= e!43166 (arrayBitRangesEq!0 (buf!1687 (_1!3019 lt!103683)) (buf!1687 (_2!3020 lt!103685)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103683))) (currentByte!3353 (_1!3019 lt!103683)) (currentBit!3348 (_1!3019 lt!103683)))))))

(assert (= (and d!20560 res!54407) b!65611))

(assert (= (and b!65611 res!54409) b!65612))

(assert (= (and b!65612 (not res!54408)) b!65613))

(assert (=> b!65611 m!103955))

(assert (=> b!65611 m!104015))

(assert (=> b!65613 m!103955))

(assert (=> b!65613 m!103955))

(declare-fun m!104121 () Bool)

(assert (=> b!65613 m!104121))

(assert (=> b!65475 d!20560))

(declare-fun d!20564 () Bool)

(declare-fun res!54410 () Bool)

(declare-fun e!43169 () Bool)

(assert (=> d!20564 (=> (not res!54410) (not e!43169))))

(assert (=> d!20564 (= res!54410 (= (size!1306 (buf!1687 thiss!1379)) (size!1306 (buf!1687 (_2!3020 lt!103684)))))))

(assert (=> d!20564 (= (isPrefixOf!0 thiss!1379 (_2!3020 lt!103684)) e!43169)))

(declare-fun b!65614 () Bool)

(declare-fun res!54412 () Bool)

(assert (=> b!65614 (=> (not res!54412) (not e!43169))))

(assert (=> b!65614 (= res!54412 (bvsle (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)) (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684)))))))

(declare-fun b!65615 () Bool)

(declare-fun e!43168 () Bool)

(assert (=> b!65615 (= e!43169 e!43168)))

(declare-fun res!54411 () Bool)

(assert (=> b!65615 (=> res!54411 e!43168)))

(assert (=> b!65615 (= res!54411 (= (size!1306 (buf!1687 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65616 () Bool)

(assert (=> b!65616 (= e!43168 (arrayBitRangesEq!0 (buf!1687 thiss!1379) (buf!1687 (_2!3020 lt!103684)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379))))))

(assert (= (and d!20564 res!54410) b!65614))

(assert (= (and b!65614 res!54412) b!65615))

(assert (= (and b!65615 (not res!54411)) b!65616))

(assert (=> b!65614 m!104013))

(assert (=> b!65614 m!103991))

(assert (=> b!65616 m!104013))

(assert (=> b!65616 m!104013))

(declare-fun m!104123 () Bool)

(assert (=> b!65616 m!104123))

(assert (=> b!65474 d!20564))

(declare-fun d!20566 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!20566 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) lt!103686) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684)))) lt!103686))))

(declare-fun bs!5013 () Bool)

(assert (= bs!5013 d!20566))

(declare-fun m!104125 () Bool)

(assert (=> bs!5013 m!104125))

(assert (=> b!65474 d!20566))

(declare-fun d!20568 () Bool)

(declare-fun e!43172 () Bool)

(assert (=> d!20568 e!43172))

(declare-fun res!54415 () Bool)

(assert (=> d!20568 (=> (not res!54415) (not e!43172))))

(assert (=> d!20568 (= res!54415 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!103813 () Unit!4425)

(declare-fun choose!27 (BitStream!2252 BitStream!2252 (_ BitVec 64) (_ BitVec 64)) Unit!4425)

(assert (=> d!20568 (= lt!103813 (choose!27 thiss!1379 (_2!3020 lt!103684) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!20568 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!20568 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3020 lt!103684) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!103813)))

(declare-fun b!65619 () Bool)

(assert (=> b!65619 (= e!43172 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!20568 res!54415) b!65619))

(declare-fun m!104127 () Bool)

(assert (=> d!20568 m!104127))

(declare-fun m!104129 () Bool)

(assert (=> b!65619 m!104129))

(assert (=> b!65474 d!20568))

(declare-fun b!65726 () Bool)

(declare-fun e!43224 () Bool)

(declare-fun e!43225 () Bool)

(assert (=> b!65726 (= e!43224 e!43225)))

(declare-fun res!54481 () Bool)

(assert (=> b!65726 (=> (not res!54481) (not e!43225))))

(declare-fun lt!104036 () tuple2!5818)

(declare-datatypes ((tuple2!5832 0))(
  ( (tuple2!5833 (_1!3027 BitStream!2252) (_2!3027 Bool)) )
))
(declare-fun lt!104025 () tuple2!5832)

(declare-fun lt!104034 () Bool)

(assert (=> b!65726 (= res!54481 (and (= (_2!3027 lt!104025) lt!104034) (= (_1!3027 lt!104025) (_2!3020 lt!104036))))))

(declare-fun readBitPure!0 (BitStream!2252) tuple2!5832)

(declare-fun readerFrom!0 (BitStream!2252 (_ BitVec 32) (_ BitVec 32)) BitStream!2252)

(assert (=> b!65726 (= lt!104025 (readBitPure!0 (readerFrom!0 (_2!3020 lt!104036) (currentBit!3348 thiss!1379) (currentByte!3353 thiss!1379))))))

(declare-fun b!65727 () Bool)

(assert (=> b!65727 (= e!43225 (= (bitIndex!0 (size!1306 (buf!1687 (_1!3027 lt!104025))) (currentByte!3353 (_1!3027 lt!104025)) (currentBit!3348 (_1!3027 lt!104025))) (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!104036))) (currentByte!3353 (_2!3020 lt!104036)) (currentBit!3348 (_2!3020 lt!104036)))))))

(declare-fun b!65728 () Bool)

(declare-fun res!54484 () Bool)

(declare-fun e!43223 () Bool)

(assert (=> b!65728 (=> (not res!54484) (not e!43223))))

(declare-fun lt!104033 () tuple2!5818)

(assert (=> b!65728 (= res!54484 (isPrefixOf!0 thiss!1379 (_2!3020 lt!104033)))))

(declare-fun b!65729 () Bool)

(declare-fun res!54486 () Bool)

(assert (=> b!65729 (=> (not res!54486) (not e!43223))))

(declare-fun lt!104035 () (_ BitVec 64))

(declare-fun lt!104029 () (_ BitVec 64))

(assert (=> b!65729 (= res!54486 (= (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!104033))) (currentByte!3353 (_2!3020 lt!104033)) (currentBit!3348 (_2!3020 lt!104033))) (bvadd lt!104029 lt!104035)))))

(assert (=> b!65729 (or (not (= (bvand lt!104029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104035 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!104029 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!104029 lt!104035) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65729 (= lt!104035 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!65729 (= lt!104029 (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)))))

(declare-fun b!65730 () Bool)

(declare-fun res!54488 () Bool)

(assert (=> b!65730 (=> (not res!54488) (not e!43224))))

(assert (=> b!65730 (= res!54488 (= (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!104036))) (currentByte!3353 (_2!3020 lt!104036)) (currentBit!3348 (_2!3020 lt!104036))) (bvadd (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!65731 () Bool)

(declare-fun res!54487 () Bool)

(assert (=> b!65731 (=> (not res!54487) (not e!43224))))

(assert (=> b!65731 (= res!54487 (isPrefixOf!0 thiss!1379 (_2!3020 lt!104036)))))

(declare-fun b!65732 () Bool)

(declare-fun e!43222 () Bool)

(declare-fun lt!104028 () tuple2!5832)

(assert (=> b!65732 (= e!43222 (= (bitIndex!0 (size!1306 (buf!1687 (_1!3027 lt!104028))) (currentByte!3353 (_1!3027 lt!104028)) (currentBit!3348 (_1!3027 lt!104028))) (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!104033))) (currentByte!3353 (_2!3020 lt!104033)) (currentBit!3348 (_2!3020 lt!104033)))))))

(declare-fun d!20570 () Bool)

(assert (=> d!20570 e!43223))

(declare-fun res!54482 () Bool)

(assert (=> d!20570 (=> (not res!54482) (not e!43223))))

(assert (=> d!20570 (= res!54482 (= (size!1306 (buf!1687 (_2!3020 lt!104033))) (size!1306 (buf!1687 thiss!1379))))))

(declare-fun lt!104031 () (_ BitVec 8))

(declare-fun lt!104027 () array!2837)

(assert (=> d!20570 (= lt!104031 (select (arr!1870 lt!104027) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!20570 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1306 lt!104027)))))

(assert (=> d!20570 (= lt!104027 (array!2838 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!104032 () tuple2!5818)

(assert (=> d!20570 (= lt!104033 (tuple2!5819 (_1!3020 lt!104032) (_2!3020 lt!104032)))))

(assert (=> d!20570 (= lt!104032 lt!104036)))

(assert (=> d!20570 e!43224))

(declare-fun res!54485 () Bool)

(assert (=> d!20570 (=> (not res!54485) (not e!43224))))

(assert (=> d!20570 (= res!54485 (= (size!1306 (buf!1687 thiss!1379)) (size!1306 (buf!1687 (_2!3020 lt!104036)))))))

(declare-fun appendBit!0 (BitStream!2252 Bool) tuple2!5818)

(assert (=> d!20570 (= lt!104036 (appendBit!0 thiss!1379 lt!104034))))

(assert (=> d!20570 (= lt!104034 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1870 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!20570 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!20570 (= (appendBitFromByte!0 thiss!1379 (select (arr!1870 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!104033)))

(declare-fun b!65725 () Bool)

(assert (=> b!65725 (= e!43223 e!43222)))

(declare-fun res!54483 () Bool)

(assert (=> b!65725 (=> (not res!54483) (not e!43222))))

(assert (=> b!65725 (= res!54483 (and (= (_2!3027 lt!104028) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1870 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!104031)) #b00000000000000000000000000000000))) (= (_1!3027 lt!104028) (_2!3020 lt!104033))))))

(declare-datatypes ((tuple2!5838 0))(
  ( (tuple2!5839 (_1!3030 array!2837) (_2!3030 BitStream!2252)) )
))
(declare-fun lt!104026 () tuple2!5838)

(declare-fun lt!104030 () BitStream!2252)

(declare-fun readBits!0 (BitStream!2252 (_ BitVec 64)) tuple2!5838)

(assert (=> b!65725 (= lt!104026 (readBits!0 lt!104030 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!65725 (= lt!104028 (readBitPure!0 lt!104030))))

(assert (=> b!65725 (= lt!104030 (readerFrom!0 (_2!3020 lt!104033) (currentBit!3348 thiss!1379) (currentByte!3353 thiss!1379)))))

(assert (= (and d!20570 res!54485) b!65730))

(assert (= (and b!65730 res!54488) b!65731))

(assert (= (and b!65731 res!54487) b!65726))

(assert (= (and b!65726 res!54481) b!65727))

(assert (= (and d!20570 res!54482) b!65729))

(assert (= (and b!65729 res!54486) b!65728))

(assert (= (and b!65728 res!54484) b!65725))

(assert (= (and b!65725 res!54483) b!65732))

(declare-fun m!104255 () Bool)

(assert (=> b!65729 m!104255))

(assert (=> b!65729 m!104013))

(declare-fun m!104257 () Bool)

(assert (=> b!65732 m!104257))

(assert (=> b!65732 m!104255))

(declare-fun m!104259 () Bool)

(assert (=> b!65725 m!104259))

(declare-fun m!104261 () Bool)

(assert (=> b!65725 m!104261))

(declare-fun m!104263 () Bool)

(assert (=> b!65725 m!104263))

(declare-fun m!104265 () Bool)

(assert (=> b!65727 m!104265))

(declare-fun m!104267 () Bool)

(assert (=> b!65727 m!104267))

(declare-fun m!104269 () Bool)

(assert (=> d!20570 m!104269))

(declare-fun m!104271 () Bool)

(assert (=> d!20570 m!104271))

(assert (=> d!20570 m!104093))

(declare-fun m!104273 () Bool)

(assert (=> b!65726 m!104273))

(assert (=> b!65726 m!104273))

(declare-fun m!104275 () Bool)

(assert (=> b!65726 m!104275))

(declare-fun m!104277 () Bool)

(assert (=> b!65728 m!104277))

(declare-fun m!104279 () Bool)

(assert (=> b!65731 m!104279))

(assert (=> b!65730 m!104267))

(assert (=> b!65730 m!104013))

(assert (=> b!65474 d!20570))

(declare-fun d!20612 () Bool)

(declare-fun e!43232 () Bool)

(assert (=> d!20612 e!43232))

(declare-fun res!54499 () Bool)

(assert (=> d!20612 (=> (not res!54499) (not e!43232))))

(declare-fun lt!104077 () (_ BitVec 64))

(declare-fun lt!104073 () (_ BitVec 64))

(declare-fun lt!104072 () (_ BitVec 64))

(assert (=> d!20612 (= res!54499 (= lt!104072 (bvsub lt!104073 lt!104077)))))

(assert (=> d!20612 (or (= (bvand lt!104073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104077 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104073 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104073 lt!104077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20612 (= lt!104077 (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684)))))))

(declare-fun lt!104075 () (_ BitVec 64))

(declare-fun lt!104074 () (_ BitVec 64))

(assert (=> d!20612 (= lt!104073 (bvmul lt!104075 lt!104074))))

(assert (=> d!20612 (or (= lt!104075 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!104074 (bvsdiv (bvmul lt!104075 lt!104074) lt!104075)))))

(assert (=> d!20612 (= lt!104074 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20612 (= lt!104075 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))))))

(assert (=> d!20612 (= lt!104072 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684)))))))

(assert (=> d!20612 (invariant!0 (currentBit!3348 (_2!3020 lt!103684)) (currentByte!3353 (_2!3020 lt!103684)) (size!1306 (buf!1687 (_2!3020 lt!103684))))))

(assert (=> d!20612 (= (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))) lt!104072)))

(declare-fun b!65745 () Bool)

(declare-fun res!54500 () Bool)

(assert (=> b!65745 (=> (not res!54500) (not e!43232))))

(assert (=> b!65745 (= res!54500 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!104072))))

(declare-fun b!65746 () Bool)

(declare-fun lt!104076 () (_ BitVec 64))

(assert (=> b!65746 (= e!43232 (bvsle lt!104072 (bvmul lt!104076 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65746 (or (= lt!104076 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!104076 #b0000000000000000000000000000000000000000000000000000000000001000) lt!104076)))))

(assert (=> b!65746 (= lt!104076 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))))))

(assert (= (and d!20612 res!54499) b!65745))

(assert (= (and b!65745 res!54500) b!65746))

(assert (=> d!20612 m!104125))

(assert (=> d!20612 m!103969))

(assert (=> b!65485 d!20612))

(declare-fun d!20620 () Bool)

(assert (=> d!20620 (= (invariant!0 (currentBit!3348 (_2!3020 lt!103685)) (currentByte!3353 (_2!3020 lt!103685)) (size!1306 (buf!1687 (_2!3020 lt!103685)))) (and (bvsge (currentBit!3348 (_2!3020 lt!103685)) #b00000000000000000000000000000000) (bvslt (currentBit!3348 (_2!3020 lt!103685)) #b00000000000000000000000000001000) (bvsge (currentByte!3353 (_2!3020 lt!103685)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3353 (_2!3020 lt!103685)) (size!1306 (buf!1687 (_2!3020 lt!103685)))) (and (= (currentBit!3348 (_2!3020 lt!103685)) #b00000000000000000000000000000000) (= (currentByte!3353 (_2!3020 lt!103685)) (size!1306 (buf!1687 (_2!3020 lt!103685))))))))))

(assert (=> b!65479 d!20620))

(declare-fun d!20622 () Bool)

(assert (=> d!20622 (= (invariant!0 (currentBit!3348 (_2!3020 lt!103684)) (currentByte!3353 (_2!3020 lt!103684)) (size!1306 (buf!1687 (_2!3020 lt!103685)))) (and (bvsge (currentBit!3348 (_2!3020 lt!103684)) #b00000000000000000000000000000000) (bvslt (currentBit!3348 (_2!3020 lt!103684)) #b00000000000000000000000000001000) (bvsge (currentByte!3353 (_2!3020 lt!103684)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3353 (_2!3020 lt!103684)) (size!1306 (buf!1687 (_2!3020 lt!103685)))) (and (= (currentBit!3348 (_2!3020 lt!103684)) #b00000000000000000000000000000000) (= (currentByte!3353 (_2!3020 lt!103684)) (size!1306 (buf!1687 (_2!3020 lt!103685))))))))))

(assert (=> b!65478 d!20622))

(declare-fun d!20624 () Bool)

(declare-fun res!54501 () Bool)

(declare-fun e!43234 () Bool)

(assert (=> d!20624 (=> (not res!54501) (not e!43234))))

(assert (=> d!20624 (= res!54501 (= (size!1306 (buf!1687 (_1!3019 lt!103683))) (size!1306 (buf!1687 (_1!3019 lt!103691)))))))

(assert (=> d!20624 (= (isPrefixOf!0 (_1!3019 lt!103683) (_1!3019 lt!103691)) e!43234)))

(declare-fun b!65747 () Bool)

(declare-fun res!54503 () Bool)

(assert (=> b!65747 (=> (not res!54503) (not e!43234))))

(assert (=> b!65747 (= res!54503 (bvsle (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103683))) (currentByte!3353 (_1!3019 lt!103683)) (currentBit!3348 (_1!3019 lt!103683))) (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103691))) (currentByte!3353 (_1!3019 lt!103691)) (currentBit!3348 (_1!3019 lt!103691)))))))

(declare-fun b!65748 () Bool)

(declare-fun e!43233 () Bool)

(assert (=> b!65748 (= e!43234 e!43233)))

(declare-fun res!54502 () Bool)

(assert (=> b!65748 (=> res!54502 e!43233)))

(assert (=> b!65748 (= res!54502 (= (size!1306 (buf!1687 (_1!3019 lt!103683))) #b00000000000000000000000000000000))))

(declare-fun b!65749 () Bool)

(assert (=> b!65749 (= e!43233 (arrayBitRangesEq!0 (buf!1687 (_1!3019 lt!103683)) (buf!1687 (_1!3019 lt!103691)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103683))) (currentByte!3353 (_1!3019 lt!103683)) (currentBit!3348 (_1!3019 lt!103683)))))))

(assert (= (and d!20624 res!54501) b!65747))

(assert (= (and b!65747 res!54503) b!65748))

(assert (= (and b!65748 (not res!54502)) b!65749))

(assert (=> b!65747 m!103955))

(assert (=> b!65747 m!103957))

(assert (=> b!65749 m!103955))

(assert (=> b!65749 m!103955))

(declare-fun m!104311 () Bool)

(assert (=> b!65749 m!104311))

(assert (=> b!65489 d!20624))

(declare-fun d!20626 () Bool)

(declare-fun res!54504 () Bool)

(declare-fun e!43236 () Bool)

(assert (=> d!20626 (=> (not res!54504) (not e!43236))))

(assert (=> d!20626 (= res!54504 (= (size!1306 (buf!1687 thiss!1379)) (size!1306 (buf!1687 thiss!1379))))))

(assert (=> d!20626 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!43236)))

(declare-fun b!65750 () Bool)

(declare-fun res!54506 () Bool)

(assert (=> b!65750 (=> (not res!54506) (not e!43236))))

(assert (=> b!65750 (= res!54506 (bvsle (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)) (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379))))))

(declare-fun b!65751 () Bool)

(declare-fun e!43235 () Bool)

(assert (=> b!65751 (= e!43236 e!43235)))

(declare-fun res!54505 () Bool)

(assert (=> b!65751 (=> res!54505 e!43235)))

(assert (=> b!65751 (= res!54505 (= (size!1306 (buf!1687 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65752 () Bool)

(assert (=> b!65752 (= e!43235 (arrayBitRangesEq!0 (buf!1687 thiss!1379) (buf!1687 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379))))))

(assert (= (and d!20626 res!54504) b!65750))

(assert (= (and b!65750 res!54506) b!65751))

(assert (= (and b!65751 (not res!54505)) b!65752))

(assert (=> b!65750 m!104013))

(assert (=> b!65750 m!104013))

(assert (=> b!65752 m!104013))

(assert (=> b!65752 m!104013))

(declare-fun m!104313 () Bool)

(assert (=> b!65752 m!104313))

(assert (=> b!65488 d!20626))

(declare-fun d!20628 () Bool)

(assert (=> d!20628 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!104080 () Unit!4425)

(declare-fun choose!11 (BitStream!2252) Unit!4425)

(assert (=> d!20628 (= lt!104080 (choose!11 thiss!1379))))

(assert (=> d!20628 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!104080)))

(declare-fun bs!5023 () Bool)

(assert (= bs!5023 d!20628))

(assert (=> bs!5023 m!104009))

(declare-fun m!104315 () Bool)

(assert (=> bs!5023 m!104315))

(assert (=> b!65488 d!20628))

(declare-fun d!20630 () Bool)

(declare-fun e!43237 () Bool)

(assert (=> d!20630 e!43237))

(declare-fun res!54507 () Bool)

(assert (=> d!20630 (=> (not res!54507) (not e!43237))))

(declare-fun lt!104082 () (_ BitVec 64))

(declare-fun lt!104086 () (_ BitVec 64))

(declare-fun lt!104081 () (_ BitVec 64))

(assert (=> d!20630 (= res!54507 (= lt!104081 (bvsub lt!104082 lt!104086)))))

(assert (=> d!20630 (or (= (bvand lt!104082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104086 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104082 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104082 lt!104086) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20630 (= lt!104086 (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 thiss!1379))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379))))))

(declare-fun lt!104084 () (_ BitVec 64))

(declare-fun lt!104083 () (_ BitVec 64))

(assert (=> d!20630 (= lt!104082 (bvmul lt!104084 lt!104083))))

(assert (=> d!20630 (or (= lt!104084 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!104083 (bvsdiv (bvmul lt!104084 lt!104083) lt!104084)))))

(assert (=> d!20630 (= lt!104083 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20630 (= lt!104084 ((_ sign_extend 32) (size!1306 (buf!1687 thiss!1379))))))

(assert (=> d!20630 (= lt!104081 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3353 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3348 thiss!1379))))))

(assert (=> d!20630 (invariant!0 (currentBit!3348 thiss!1379) (currentByte!3353 thiss!1379) (size!1306 (buf!1687 thiss!1379)))))

(assert (=> d!20630 (= (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)) lt!104081)))

(declare-fun b!65753 () Bool)

(declare-fun res!54508 () Bool)

(assert (=> b!65753 (=> (not res!54508) (not e!43237))))

(assert (=> b!65753 (= res!54508 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!104081))))

(declare-fun b!65754 () Bool)

(declare-fun lt!104085 () (_ BitVec 64))

(assert (=> b!65754 (= e!43237 (bvsle lt!104081 (bvmul lt!104085 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65754 (or (= lt!104085 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!104085 #b0000000000000000000000000000000000000000000000000000000000001000) lt!104085)))))

(assert (=> b!65754 (= lt!104085 ((_ sign_extend 32) (size!1306 (buf!1687 thiss!1379))))))

(assert (= (and d!20630 res!54507) b!65753))

(assert (= (and b!65753 res!54508) b!65754))

(declare-fun m!104317 () Bool)

(assert (=> d!20630 m!104317))

(declare-fun m!104319 () Bool)

(assert (=> d!20630 m!104319))

(assert (=> b!65488 d!20630))

(declare-fun d!20632 () Bool)

(assert (=> d!20632 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 thiss!1379))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 thiss!1379))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5024 () Bool)

(assert (= bs!5024 d!20632))

(assert (=> bs!5024 m!104317))

(assert (=> b!65477 d!20632))

(declare-fun d!20634 () Bool)

(assert (=> d!20634 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103683)))) ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103683))) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103683))) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103683)))) ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103683))) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103683)))) (bvsub to!314 i!635)))))

(declare-fun bs!5025 () Bool)

(assert (= bs!5025 d!20634))

(declare-fun m!104321 () Bool)

(assert (=> bs!5025 m!104321))

(assert (=> b!65471 d!20634))

(declare-fun d!20636 () Bool)

(declare-fun size!1309 (List!701) Int)

(assert (=> d!20636 (= (length!329 lt!103695) (size!1309 lt!103695))))

(declare-fun bs!5026 () Bool)

(assert (= bs!5026 d!20636))

(declare-fun m!104323 () Bool)

(assert (=> bs!5026 m!104323))

(assert (=> b!65470 d!20636))

(declare-fun d!20638 () Bool)

(assert (=> d!20638 (= (array_inv!1185 srcBuffer!2) (bvsge (size!1306 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!12772 d!20638))

(declare-fun d!20640 () Bool)

(assert (=> d!20640 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3348 thiss!1379) (currentByte!3353 thiss!1379) (size!1306 (buf!1687 thiss!1379))))))

(declare-fun bs!5027 () Bool)

(assert (= bs!5027 d!20640))

(assert (=> bs!5027 m!104319))

(assert (=> start!12772 d!20640))

(declare-fun b!65814 () Bool)

(declare-fun e!43264 () tuple2!5818)

(declare-fun lt!104357 () tuple2!5818)

(declare-fun Unit!4438 () Unit!4425)

(assert (=> b!65814 (= e!43264 (tuple2!5819 Unit!4438 (_2!3020 lt!104357)))))

(declare-fun lt!104377 () tuple2!5818)

(assert (=> b!65814 (= lt!104377 (appendBitFromByte!0 (_2!3020 lt!103684) (select (arr!1870 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!104356 () (_ BitVec 64))

(assert (=> b!65814 (= lt!104356 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104344 () (_ BitVec 64))

(assert (=> b!65814 (= lt!104344 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!104343 () Unit!4425)

(assert (=> b!65814 (= lt!104343 (validateOffsetBitsIneqLemma!0 (_2!3020 lt!103684) (_2!3020 lt!104377) lt!104356 lt!104344))))

(assert (=> b!65814 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!104377)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!104377))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!104377))) (bvsub lt!104356 lt!104344))))

(declare-fun lt!104373 () Unit!4425)

(assert (=> b!65814 (= lt!104373 lt!104343)))

(declare-fun lt!104369 () tuple2!5816)

(declare-fun call!841 () tuple2!5816)

(assert (=> b!65814 (= lt!104369 call!841)))

(declare-fun lt!104366 () (_ BitVec 64))

(assert (=> b!65814 (= lt!104366 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!104372 () Unit!4425)

(assert (=> b!65814 (= lt!104372 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3020 lt!103684) (buf!1687 (_2!3020 lt!104377)) lt!104366))))

(assert (=> b!65814 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!104377)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) lt!104366)))

(declare-fun lt!104375 () Unit!4425)

(assert (=> b!65814 (= lt!104375 lt!104372)))

(assert (=> b!65814 (= (head!520 (byteArrayBitContentToList!0 (_2!3020 lt!104377) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!520 (bitStreamReadBitsIntoList!0 (_2!3020 lt!104377) (_1!3019 lt!104369) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!104365 () Unit!4425)

(declare-fun Unit!4439 () Unit!4425)

(assert (=> b!65814 (= lt!104365 Unit!4439)))

(assert (=> b!65814 (= lt!104357 (appendBitsMSBFirstLoop!0 (_2!3020 lt!104377) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!104367 () Unit!4425)

(assert (=> b!65814 (= lt!104367 (lemmaIsPrefixTransitive!0 (_2!3020 lt!103684) (_2!3020 lt!104377) (_2!3020 lt!104357)))))

(assert (=> b!65814 (isPrefixOf!0 (_2!3020 lt!103684) (_2!3020 lt!104357))))

(declare-fun lt!104347 () Unit!4425)

(assert (=> b!65814 (= lt!104347 lt!104367)))

(assert (=> b!65814 (= (size!1306 (buf!1687 (_2!3020 lt!104357))) (size!1306 (buf!1687 (_2!3020 lt!103684))))))

(declare-fun lt!104337 () Unit!4425)

(declare-fun Unit!4440 () Unit!4425)

(assert (=> b!65814 (= lt!104337 Unit!4440)))

(assert (=> b!65814 (= (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!104357))) (currentByte!3353 (_2!3020 lt!104357)) (currentBit!3348 (_2!3020 lt!104357))) (bvsub (bvadd (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104348 () Unit!4425)

(declare-fun Unit!4441 () Unit!4425)

(assert (=> b!65814 (= lt!104348 Unit!4441)))

(assert (=> b!65814 (= (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!104357))) (currentByte!3353 (_2!3020 lt!104357)) (currentBit!3348 (_2!3020 lt!104357))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!104377))) (currentByte!3353 (_2!3020 lt!104377)) (currentBit!3348 (_2!3020 lt!104377))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104361 () Unit!4425)

(declare-fun Unit!4442 () Unit!4425)

(assert (=> b!65814 (= lt!104361 Unit!4442)))

(declare-fun lt!104379 () tuple2!5816)

(assert (=> b!65814 (= lt!104379 (reader!0 (_2!3020 lt!103684) (_2!3020 lt!104357)))))

(declare-fun lt!104371 () (_ BitVec 64))

(assert (=> b!65814 (= lt!104371 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104362 () Unit!4425)

(assert (=> b!65814 (= lt!104362 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3020 lt!103684) (buf!1687 (_2!3020 lt!104357)) lt!104371))))

(assert (=> b!65814 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!104357)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) lt!104371)))

(declare-fun lt!104359 () Unit!4425)

(assert (=> b!65814 (= lt!104359 lt!104362)))

(declare-fun lt!104345 () tuple2!5816)

(assert (=> b!65814 (= lt!104345 (reader!0 (_2!3020 lt!104377) (_2!3020 lt!104357)))))

(declare-fun lt!104342 () (_ BitVec 64))

(assert (=> b!65814 (= lt!104342 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!104374 () Unit!4425)

(assert (=> b!65814 (= lt!104374 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3020 lt!104377) (buf!1687 (_2!3020 lt!104357)) lt!104342))))

(assert (=> b!65814 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!104357)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!104377))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!104377))) lt!104342)))

(declare-fun lt!104376 () Unit!4425)

(assert (=> b!65814 (= lt!104376 lt!104374)))

(declare-fun lt!104360 () List!701)

(assert (=> b!65814 (= lt!104360 (byteArrayBitContentToList!0 (_2!3020 lt!104357) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!104346 () List!701)

(assert (=> b!65814 (= lt!104346 (byteArrayBitContentToList!0 (_2!3020 lt!104357) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!104353 () List!701)

(assert (=> b!65814 (= lt!104353 (bitStreamReadBitsIntoList!0 (_2!3020 lt!104357) (_1!3019 lt!104379) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!104380 () List!701)

(assert (=> b!65814 (= lt!104380 (bitStreamReadBitsIntoList!0 (_2!3020 lt!104357) (_1!3019 lt!104345) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!104350 () (_ BitVec 64))

(assert (=> b!65814 (= lt!104350 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!104338 () Unit!4425)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2252 BitStream!2252 BitStream!2252 BitStream!2252 (_ BitVec 64) List!701) Unit!4425)

(assert (=> b!65814 (= lt!104338 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3020 lt!104357) (_2!3020 lt!104357) (_1!3019 lt!104379) (_1!3019 lt!104345) lt!104350 lt!104353))))

(declare-fun tail!307 (List!701) List!701)

(assert (=> b!65814 (= (bitStreamReadBitsIntoList!0 (_2!3020 lt!104357) (_1!3019 lt!104345) (bvsub lt!104350 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!307 lt!104353))))

(declare-fun lt!104351 () Unit!4425)

(assert (=> b!65814 (= lt!104351 lt!104338)))

(declare-fun lt!104363 () Unit!4425)

(declare-fun lt!104368 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2837 array!2837 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4425)

(assert (=> b!65814 (= lt!104363 (arrayBitRangesEqImpliesEq!0 (buf!1687 (_2!3020 lt!104377)) (buf!1687 (_2!3020 lt!104357)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!104368 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!104377))) (currentByte!3353 (_2!3020 lt!104377)) (currentBit!3348 (_2!3020 lt!104377)))))))

(declare-fun bitAt!0 (array!2837 (_ BitVec 64)) Bool)

(assert (=> b!65814 (= (bitAt!0 (buf!1687 (_2!3020 lt!104377)) lt!104368) (bitAt!0 (buf!1687 (_2!3020 lt!104357)) lt!104368))))

(declare-fun lt!104370 () Unit!4425)

(assert (=> b!65814 (= lt!104370 lt!104363)))

(declare-fun d!20642 () Bool)

(declare-fun e!43265 () Bool)

(assert (=> d!20642 e!43265))

(declare-fun res!54557 () Bool)

(assert (=> d!20642 (=> (not res!54557) (not e!43265))))

(declare-fun lt!104355 () tuple2!5818)

(declare-fun lt!104340 () (_ BitVec 64))

(assert (=> d!20642 (= res!54557 (= (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!104355))) (currentByte!3353 (_2!3020 lt!104355)) (currentBit!3348 (_2!3020 lt!104355))) (bvsub lt!104340 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!20642 (or (= (bvand lt!104340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104340 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!104349 () (_ BitVec 64))

(assert (=> d!20642 (= lt!104340 (bvadd lt!104349 to!314))))

(assert (=> d!20642 (or (not (= (bvand lt!104349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!104349 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!104349 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20642 (= lt!104349 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))))))

(assert (=> d!20642 (= lt!104355 e!43264)))

(declare-fun c!4776 () Bool)

(assert (=> d!20642 (= c!4776 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!104339 () Unit!4425)

(declare-fun lt!104358 () Unit!4425)

(assert (=> d!20642 (= lt!104339 lt!104358)))

(assert (=> d!20642 (isPrefixOf!0 (_2!3020 lt!103684) (_2!3020 lt!103684))))

(assert (=> d!20642 (= lt!104358 (lemmaIsPrefixRefl!0 (_2!3020 lt!103684)))))

(assert (=> d!20642 (= lt!104368 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))))))

(assert (=> d!20642 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20642 (= (appendBitsMSBFirstLoop!0 (_2!3020 lt!103684) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!104355)))

(declare-fun bm!838 () Bool)

(assert (=> bm!838 (= call!841 (reader!0 (_2!3020 lt!103684) (ite c!4776 (_2!3020 lt!104377) (_2!3020 lt!103684))))))

(declare-fun b!65815 () Bool)

(declare-fun e!43266 () Bool)

(declare-fun lt!104352 () (_ BitVec 64))

(assert (=> b!65815 (= e!43266 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) lt!104352))))

(declare-fun b!65816 () Bool)

(declare-fun res!54558 () Bool)

(assert (=> b!65816 (=> (not res!54558) (not e!43265))))

(assert (=> b!65816 (= res!54558 (= (size!1306 (buf!1687 (_2!3020 lt!103684))) (size!1306 (buf!1687 (_2!3020 lt!104355)))))))

(declare-fun lt!104341 () tuple2!5816)

(declare-fun b!65817 () Bool)

(assert (=> b!65817 (= e!43265 (= (bitStreamReadBitsIntoList!0 (_2!3020 lt!104355) (_1!3019 lt!104341) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3020 lt!104355) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!65817 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65817 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!104364 () Unit!4425)

(declare-fun lt!104378 () Unit!4425)

(assert (=> b!65817 (= lt!104364 lt!104378)))

(assert (=> b!65817 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!104355)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) lt!104352)))

(assert (=> b!65817 (= lt!104378 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3020 lt!103684) (buf!1687 (_2!3020 lt!104355)) lt!104352))))

(assert (=> b!65817 e!43266))

(declare-fun res!54561 () Bool)

(assert (=> b!65817 (=> (not res!54561) (not e!43266))))

(assert (=> b!65817 (= res!54561 (and (= (size!1306 (buf!1687 (_2!3020 lt!103684))) (size!1306 (buf!1687 (_2!3020 lt!104355)))) (bvsge lt!104352 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65817 (= lt!104352 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!65817 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65817 (= lt!104341 (reader!0 (_2!3020 lt!103684) (_2!3020 lt!104355)))))

(declare-fun b!65818 () Bool)

(declare-fun res!54560 () Bool)

(assert (=> b!65818 (=> (not res!54560) (not e!43265))))

(assert (=> b!65818 (= res!54560 (invariant!0 (currentBit!3348 (_2!3020 lt!104355)) (currentByte!3353 (_2!3020 lt!104355)) (size!1306 (buf!1687 (_2!3020 lt!104355)))))))

(declare-fun b!65819 () Bool)

(declare-fun res!54559 () Bool)

(assert (=> b!65819 (=> (not res!54559) (not e!43265))))

(assert (=> b!65819 (= res!54559 (= (size!1306 (buf!1687 (_2!3020 lt!104355))) (size!1306 (buf!1687 (_2!3020 lt!103684)))))))

(declare-fun b!65820 () Bool)

(declare-fun res!54556 () Bool)

(assert (=> b!65820 (=> (not res!54556) (not e!43265))))

(assert (=> b!65820 (= res!54556 (isPrefixOf!0 (_2!3020 lt!103684) (_2!3020 lt!104355)))))

(declare-fun b!65821 () Bool)

(declare-fun Unit!4450 () Unit!4425)

(assert (=> b!65821 (= e!43264 (tuple2!5819 Unit!4450 (_2!3020 lt!103684)))))

(assert (=> b!65821 (= (size!1306 (buf!1687 (_2!3020 lt!103684))) (size!1306 (buf!1687 (_2!3020 lt!103684))))))

(declare-fun lt!104354 () Unit!4425)

(declare-fun Unit!4451 () Unit!4425)

(assert (=> b!65821 (= lt!104354 Unit!4451)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2252 array!2837 array!2837 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!65821 (checkByteArrayBitContent!0 (_2!3020 lt!103684) srcBuffer!2 (_1!3030 (readBits!0 (_1!3019 call!841) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (= (and d!20642 c!4776) b!65814))

(assert (= (and d!20642 (not c!4776)) b!65821))

(assert (= (or b!65814 b!65821) bm!838))

(assert (= (and d!20642 res!54557) b!65818))

(assert (= (and b!65818 res!54560) b!65816))

(assert (= (and b!65816 res!54558) b!65820))

(assert (= (and b!65820 res!54556) b!65819))

(assert (= (and b!65819 res!54559) b!65817))

(assert (= (and b!65817 res!54561) b!65815))

(declare-fun m!104447 () Bool)

(assert (=> d!20642 m!104447))

(assert (=> d!20642 m!103991))

(declare-fun m!104449 () Bool)

(assert (=> d!20642 m!104449))

(declare-fun m!104451 () Bool)

(assert (=> d!20642 m!104451))

(declare-fun m!104453 () Bool)

(assert (=> b!65814 m!104453))

(declare-fun m!104455 () Bool)

(assert (=> b!65814 m!104455))

(declare-fun m!104457 () Bool)

(assert (=> b!65814 m!104457))

(declare-fun m!104459 () Bool)

(assert (=> b!65814 m!104459))

(declare-fun m!104461 () Bool)

(assert (=> b!65814 m!104461))

(declare-fun m!104463 () Bool)

(assert (=> b!65814 m!104463))

(declare-fun m!104465 () Bool)

(assert (=> b!65814 m!104465))

(declare-fun m!104467 () Bool)

(assert (=> b!65814 m!104467))

(declare-fun m!104469 () Bool)

(assert (=> b!65814 m!104469))

(declare-fun m!104471 () Bool)

(assert (=> b!65814 m!104471))

(declare-fun m!104473 () Bool)

(assert (=> b!65814 m!104473))

(declare-fun m!104475 () Bool)

(assert (=> b!65814 m!104475))

(declare-fun m!104477 () Bool)

(assert (=> b!65814 m!104477))

(declare-fun m!104479 () Bool)

(assert (=> b!65814 m!104479))

(declare-fun m!104481 () Bool)

(assert (=> b!65814 m!104481))

(declare-fun m!104483 () Bool)

(assert (=> b!65814 m!104483))

(assert (=> b!65814 m!104469))

(assert (=> b!65814 m!104481))

(declare-fun m!104485 () Bool)

(assert (=> b!65814 m!104485))

(declare-fun m!104487 () Bool)

(assert (=> b!65814 m!104487))

(declare-fun m!104489 () Bool)

(assert (=> b!65814 m!104489))

(declare-fun m!104491 () Bool)

(assert (=> b!65814 m!104491))

(declare-fun m!104493 () Bool)

(assert (=> b!65814 m!104493))

(declare-fun m!104495 () Bool)

(assert (=> b!65814 m!104495))

(assert (=> b!65814 m!104467))

(declare-fun m!104497 () Bool)

(assert (=> b!65814 m!104497))

(declare-fun m!104499 () Bool)

(assert (=> b!65814 m!104499))

(declare-fun m!104501 () Bool)

(assert (=> b!65814 m!104501))

(declare-fun m!104503 () Bool)

(assert (=> b!65814 m!104503))

(declare-fun m!104505 () Bool)

(assert (=> b!65814 m!104505))

(declare-fun m!104507 () Bool)

(assert (=> b!65814 m!104507))

(declare-fun m!104509 () Bool)

(assert (=> b!65814 m!104509))

(assert (=> b!65814 m!103991))

(declare-fun m!104511 () Bool)

(assert (=> b!65814 m!104511))

(assert (=> b!65814 m!104507))

(declare-fun m!104513 () Bool)

(assert (=> b!65814 m!104513))

(declare-fun m!104515 () Bool)

(assert (=> b!65817 m!104515))

(declare-fun m!104517 () Bool)

(assert (=> b!65817 m!104517))

(declare-fun m!104519 () Bool)

(assert (=> b!65817 m!104519))

(declare-fun m!104521 () Bool)

(assert (=> b!65817 m!104521))

(declare-fun m!104523 () Bool)

(assert (=> b!65817 m!104523))

(declare-fun m!104525 () Bool)

(assert (=> bm!838 m!104525))

(declare-fun m!104527 () Bool)

(assert (=> b!65820 m!104527))

(declare-fun m!104529 () Bool)

(assert (=> b!65818 m!104529))

(declare-fun m!104531 () Bool)

(assert (=> b!65815 m!104531))

(declare-fun m!104533 () Bool)

(assert (=> b!65821 m!104533))

(declare-fun m!104535 () Bool)

(assert (=> b!65821 m!104535))

(assert (=> b!65481 d!20642))

(declare-fun d!20676 () Bool)

(declare-fun res!54562 () Bool)

(declare-fun e!43268 () Bool)

(assert (=> d!20676 (=> (not res!54562) (not e!43268))))

(assert (=> d!20676 (= res!54562 (= (size!1306 (buf!1687 thiss!1379)) (size!1306 (buf!1687 (_2!3020 lt!103685)))))))

(assert (=> d!20676 (= (isPrefixOf!0 thiss!1379 (_2!3020 lt!103685)) e!43268)))

(declare-fun b!65822 () Bool)

(declare-fun res!54564 () Bool)

(assert (=> b!65822 (=> (not res!54564) (not e!43268))))

(assert (=> b!65822 (= res!54564 (bvsle (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)) (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103685))) (currentByte!3353 (_2!3020 lt!103685)) (currentBit!3348 (_2!3020 lt!103685)))))))

(declare-fun b!65823 () Bool)

(declare-fun e!43267 () Bool)

(assert (=> b!65823 (= e!43268 e!43267)))

(declare-fun res!54563 () Bool)

(assert (=> b!65823 (=> res!54563 e!43267)))

(assert (=> b!65823 (= res!54563 (= (size!1306 (buf!1687 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!65824 () Bool)

(assert (=> b!65824 (= e!43267 (arrayBitRangesEq!0 (buf!1687 thiss!1379) (buf!1687 (_2!3020 lt!103685)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379))))))

(assert (= (and d!20676 res!54562) b!65822))

(assert (= (and b!65822 res!54564) b!65823))

(assert (= (and b!65823 (not res!54563)) b!65824))

(assert (=> b!65822 m!104013))

(assert (=> b!65822 m!104015))

(assert (=> b!65824 m!104013))

(assert (=> b!65824 m!104013))

(declare-fun m!104537 () Bool)

(assert (=> b!65824 m!104537))

(assert (=> b!65481 d!20676))

(declare-fun d!20678 () Bool)

(declare-fun res!54565 () Bool)

(declare-fun e!43270 () Bool)

(assert (=> d!20678 (=> (not res!54565) (not e!43270))))

(assert (=> d!20678 (= res!54565 (= (size!1306 (buf!1687 (_2!3020 lt!103684))) (size!1306 (buf!1687 (_2!3020 lt!103685)))))))

(assert (=> d!20678 (= (isPrefixOf!0 (_2!3020 lt!103684) (_2!3020 lt!103685)) e!43270)))

(declare-fun b!65825 () Bool)

(declare-fun res!54567 () Bool)

(assert (=> b!65825 (=> (not res!54567) (not e!43270))))

(assert (=> b!65825 (= res!54567 (bvsle (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))) (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103685))) (currentByte!3353 (_2!3020 lt!103685)) (currentBit!3348 (_2!3020 lt!103685)))))))

(declare-fun b!65826 () Bool)

(declare-fun e!43269 () Bool)

(assert (=> b!65826 (= e!43270 e!43269)))

(declare-fun res!54566 () Bool)

(assert (=> b!65826 (=> res!54566 e!43269)))

(assert (=> b!65826 (= res!54566 (= (size!1306 (buf!1687 (_2!3020 lt!103684))) #b00000000000000000000000000000000))))

(declare-fun b!65827 () Bool)

(assert (=> b!65827 (= e!43269 (arrayBitRangesEq!0 (buf!1687 (_2!3020 lt!103684)) (buf!1687 (_2!3020 lt!103685)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684)))))))

(assert (= (and d!20678 res!54565) b!65825))

(assert (= (and b!65825 res!54567) b!65826))

(assert (= (and b!65826 (not res!54566)) b!65827))

(assert (=> b!65825 m!103991))

(assert (=> b!65825 m!104015))

(assert (=> b!65827 m!103991))

(assert (=> b!65827 m!103991))

(declare-fun m!104539 () Bool)

(assert (=> b!65827 m!104539))

(assert (=> b!65481 d!20678))

(declare-fun b!65842 () Bool)

(declare-fun res!54576 () Bool)

(declare-fun e!43277 () Bool)

(assert (=> b!65842 (=> (not res!54576) (not e!43277))))

(declare-fun lt!104480 () tuple2!5816)

(assert (=> b!65842 (= res!54576 (isPrefixOf!0 (_2!3019 lt!104480) (_2!3020 lt!103684)))))

(declare-fun lt!104479 () (_ BitVec 64))

(declare-fun b!65843 () Bool)

(declare-fun lt!104471 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2252 (_ BitVec 64)) BitStream!2252)

(assert (=> b!65843 (= e!43277 (= (_1!3019 lt!104480) (withMovedBitIndex!0 (_2!3019 lt!104480) (bvsub lt!104479 lt!104471))))))

(assert (=> b!65843 (or (= (bvand lt!104479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104471 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104479 lt!104471) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65843 (= lt!104471 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))))))

(assert (=> b!65843 (= lt!104479 (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)))))

(declare-fun b!65844 () Bool)

(declare-fun res!54574 () Bool)

(assert (=> b!65844 (=> (not res!54574) (not e!43277))))

(assert (=> b!65844 (= res!54574 (isPrefixOf!0 (_1!3019 lt!104480) thiss!1379))))

(declare-fun b!65846 () Bool)

(declare-fun e!43278 () Unit!4425)

(declare-fun lt!104468 () Unit!4425)

(assert (=> b!65846 (= e!43278 lt!104468)))

(declare-fun lt!104476 () (_ BitVec 64))

(assert (=> b!65846 (= lt!104476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!104469 () (_ BitVec 64))

(assert (=> b!65846 (= lt!104469 (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2837 array!2837 (_ BitVec 64) (_ BitVec 64)) Unit!4425)

(assert (=> b!65846 (= lt!104468 (arrayBitRangesEqSymmetric!0 (buf!1687 thiss!1379) (buf!1687 (_2!3020 lt!103684)) lt!104476 lt!104469))))

(assert (=> b!65846 (arrayBitRangesEq!0 (buf!1687 (_2!3020 lt!103684)) (buf!1687 thiss!1379) lt!104476 lt!104469)))

(declare-fun d!20680 () Bool)

(assert (=> d!20680 e!43277))

(declare-fun res!54575 () Bool)

(assert (=> d!20680 (=> (not res!54575) (not e!43277))))

(assert (=> d!20680 (= res!54575 (isPrefixOf!0 (_1!3019 lt!104480) (_2!3019 lt!104480)))))

(declare-fun lt!104465 () BitStream!2252)

(assert (=> d!20680 (= lt!104480 (tuple2!5817 lt!104465 (_2!3020 lt!103684)))))

(declare-fun lt!104470 () Unit!4425)

(declare-fun lt!104466 () Unit!4425)

(assert (=> d!20680 (= lt!104470 lt!104466)))

(assert (=> d!20680 (isPrefixOf!0 lt!104465 (_2!3020 lt!103684))))

(assert (=> d!20680 (= lt!104466 (lemmaIsPrefixTransitive!0 lt!104465 (_2!3020 lt!103684) (_2!3020 lt!103684)))))

(declare-fun lt!104473 () Unit!4425)

(declare-fun lt!104464 () Unit!4425)

(assert (=> d!20680 (= lt!104473 lt!104464)))

(assert (=> d!20680 (isPrefixOf!0 lt!104465 (_2!3020 lt!103684))))

(assert (=> d!20680 (= lt!104464 (lemmaIsPrefixTransitive!0 lt!104465 thiss!1379 (_2!3020 lt!103684)))))

(declare-fun lt!104478 () Unit!4425)

(assert (=> d!20680 (= lt!104478 e!43278)))

(declare-fun c!4781 () Bool)

(assert (=> d!20680 (= c!4781 (not (= (size!1306 (buf!1687 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!104474 () Unit!4425)

(declare-fun lt!104477 () Unit!4425)

(assert (=> d!20680 (= lt!104474 lt!104477)))

(assert (=> d!20680 (isPrefixOf!0 (_2!3020 lt!103684) (_2!3020 lt!103684))))

(assert (=> d!20680 (= lt!104477 (lemmaIsPrefixRefl!0 (_2!3020 lt!103684)))))

(declare-fun lt!104472 () Unit!4425)

(declare-fun lt!104481 () Unit!4425)

(assert (=> d!20680 (= lt!104472 lt!104481)))

(assert (=> d!20680 (= lt!104481 (lemmaIsPrefixRefl!0 (_2!3020 lt!103684)))))

(declare-fun lt!104475 () Unit!4425)

(declare-fun lt!104482 () Unit!4425)

(assert (=> d!20680 (= lt!104475 lt!104482)))

(assert (=> d!20680 (isPrefixOf!0 lt!104465 lt!104465)))

(assert (=> d!20680 (= lt!104482 (lemmaIsPrefixRefl!0 lt!104465))))

(declare-fun lt!104467 () Unit!4425)

(declare-fun lt!104463 () Unit!4425)

(assert (=> d!20680 (= lt!104467 lt!104463)))

(assert (=> d!20680 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20680 (= lt!104463 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20680 (= lt!104465 (BitStream!2253 (buf!1687 (_2!3020 lt!103684)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)))))

(assert (=> d!20680 (isPrefixOf!0 thiss!1379 (_2!3020 lt!103684))))

(assert (=> d!20680 (= (reader!0 thiss!1379 (_2!3020 lt!103684)) lt!104480)))

(declare-fun b!65845 () Bool)

(declare-fun Unit!4454 () Unit!4425)

(assert (=> b!65845 (= e!43278 Unit!4454)))

(assert (= (and d!20680 c!4781) b!65846))

(assert (= (and d!20680 (not c!4781)) b!65845))

(assert (= (and d!20680 res!54575) b!65844))

(assert (= (and b!65844 res!54574) b!65842))

(assert (= (and b!65842 res!54576) b!65843))

(declare-fun m!104541 () Bool)

(assert (=> b!65842 m!104541))

(assert (=> d!20680 m!103979))

(declare-fun m!104543 () Bool)

(assert (=> d!20680 m!104543))

(assert (=> d!20680 m!104009))

(declare-fun m!104545 () Bool)

(assert (=> d!20680 m!104545))

(assert (=> d!20680 m!104449))

(declare-fun m!104547 () Bool)

(assert (=> d!20680 m!104547))

(assert (=> d!20680 m!104451))

(assert (=> d!20680 m!104011))

(declare-fun m!104549 () Bool)

(assert (=> d!20680 m!104549))

(declare-fun m!104551 () Bool)

(assert (=> d!20680 m!104551))

(declare-fun m!104553 () Bool)

(assert (=> d!20680 m!104553))

(declare-fun m!104555 () Bool)

(assert (=> b!65843 m!104555))

(assert (=> b!65843 m!103991))

(assert (=> b!65843 m!104013))

(declare-fun m!104557 () Bool)

(assert (=> b!65844 m!104557))

(assert (=> b!65846 m!104013))

(declare-fun m!104559 () Bool)

(assert (=> b!65846 m!104559))

(declare-fun m!104561 () Bool)

(assert (=> b!65846 m!104561))

(assert (=> b!65481 d!20680))

(declare-fun d!20682 () Bool)

(assert (=> d!20682 (isPrefixOf!0 thiss!1379 (_2!3020 lt!103685))))

(declare-fun lt!104519 () Unit!4425)

(declare-fun choose!30 (BitStream!2252 BitStream!2252 BitStream!2252) Unit!4425)

(assert (=> d!20682 (= lt!104519 (choose!30 thiss!1379 (_2!3020 lt!103684) (_2!3020 lt!103685)))))

(assert (=> d!20682 (isPrefixOf!0 thiss!1379 (_2!3020 lt!103684))))

(assert (=> d!20682 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3020 lt!103684) (_2!3020 lt!103685)) lt!104519)))

(declare-fun bs!5034 () Bool)

(assert (= bs!5034 d!20682))

(assert (=> bs!5034 m!103947))

(declare-fun m!104563 () Bool)

(assert (=> bs!5034 m!104563))

(assert (=> bs!5034 m!103979))

(assert (=> b!65481 d!20682))

(declare-fun d!20684 () Bool)

(assert (=> d!20684 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5035 () Bool)

(assert (= bs!5035 d!20684))

(declare-fun m!104565 () Bool)

(assert (=> bs!5035 m!104565))

(assert (=> b!65481 d!20684))

(declare-fun d!20686 () Bool)

(assert (=> d!20686 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103684)))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!104534 () Unit!4425)

(declare-fun choose!9 (BitStream!2252 array!2837 (_ BitVec 64) BitStream!2252) Unit!4425)

(assert (=> d!20686 (= lt!104534 (choose!9 thiss!1379 (buf!1687 (_2!3020 lt!103684)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2253 (buf!1687 (_2!3020 lt!103684)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379))))))

(assert (=> d!20686 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1687 (_2!3020 lt!103684)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!104534)))

(declare-fun bs!5036 () Bool)

(assert (= bs!5036 d!20686))

(assert (=> bs!5036 m!103945))

(declare-fun m!104567 () Bool)

(assert (=> bs!5036 m!104567))

(assert (=> b!65481 d!20686))

(declare-fun d!20688 () Bool)

(declare-fun e!43283 () Bool)

(assert (=> d!20688 e!43283))

(declare-fun res!54589 () Bool)

(assert (=> d!20688 (=> (not res!54589) (not e!43283))))

(declare-fun lt!104535 () (_ BitVec 64))

(declare-fun lt!104540 () (_ BitVec 64))

(declare-fun lt!104536 () (_ BitVec 64))

(assert (=> d!20688 (= res!54589 (= lt!104535 (bvsub lt!104536 lt!104540)))))

(assert (=> d!20688 (or (= (bvand lt!104536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104540 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104536 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104536 lt!104540) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20688 (= lt!104540 (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103683)))) ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103683))) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103683)))))))

(declare-fun lt!104538 () (_ BitVec 64))

(declare-fun lt!104537 () (_ BitVec 64))

(assert (=> d!20688 (= lt!104536 (bvmul lt!104538 lt!104537))))

(assert (=> d!20688 (or (= lt!104538 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!104537 (bvsdiv (bvmul lt!104538 lt!104537) lt!104538)))))

(assert (=> d!20688 (= lt!104537 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20688 (= lt!104538 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103683)))))))

(assert (=> d!20688 (= lt!104535 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103683))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103683)))))))

(assert (=> d!20688 (invariant!0 (currentBit!3348 (_1!3019 lt!103683)) (currentByte!3353 (_1!3019 lt!103683)) (size!1306 (buf!1687 (_1!3019 lt!103683))))))

(assert (=> d!20688 (= (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103683))) (currentByte!3353 (_1!3019 lt!103683)) (currentBit!3348 (_1!3019 lt!103683))) lt!104535)))

(declare-fun b!65859 () Bool)

(declare-fun res!54590 () Bool)

(assert (=> b!65859 (=> (not res!54590) (not e!43283))))

(assert (=> b!65859 (= res!54590 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!104535))))

(declare-fun b!65860 () Bool)

(declare-fun lt!104539 () (_ BitVec 64))

(assert (=> b!65860 (= e!43283 (bvsle lt!104535 (bvmul lt!104539 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65860 (or (= lt!104539 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!104539 #b0000000000000000000000000000000000000000000000000000000000001000) lt!104539)))))

(assert (=> b!65860 (= lt!104539 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103683)))))))

(assert (= (and d!20688 res!54589) b!65859))

(assert (= (and b!65859 res!54590) b!65860))

(assert (=> d!20688 m!104321))

(declare-fun m!104569 () Bool)

(assert (=> d!20688 m!104569))

(assert (=> b!65491 d!20688))

(declare-fun d!20690 () Bool)

(declare-fun e!43284 () Bool)

(assert (=> d!20690 e!43284))

(declare-fun res!54591 () Bool)

(assert (=> d!20690 (=> (not res!54591) (not e!43284))))

(declare-fun lt!104546 () (_ BitVec 64))

(declare-fun lt!104541 () (_ BitVec 64))

(declare-fun lt!104542 () (_ BitVec 64))

(assert (=> d!20690 (= res!54591 (= lt!104541 (bvsub lt!104542 lt!104546)))))

(assert (=> d!20690 (or (= (bvand lt!104542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104546 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104542 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104542 lt!104546) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20690 (= lt!104546 (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103691)))) ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103691))) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103691)))))))

(declare-fun lt!104544 () (_ BitVec 64))

(declare-fun lt!104543 () (_ BitVec 64))

(assert (=> d!20690 (= lt!104542 (bvmul lt!104544 lt!104543))))

(assert (=> d!20690 (or (= lt!104544 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!104543 (bvsdiv (bvmul lt!104544 lt!104543) lt!104544)))))

(assert (=> d!20690 (= lt!104543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20690 (= lt!104544 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103691)))))))

(assert (=> d!20690 (= lt!104541 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103691))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103691)))))))

(assert (=> d!20690 (invariant!0 (currentBit!3348 (_1!3019 lt!103691)) (currentByte!3353 (_1!3019 lt!103691)) (size!1306 (buf!1687 (_1!3019 lt!103691))))))

(assert (=> d!20690 (= (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103691))) (currentByte!3353 (_1!3019 lt!103691)) (currentBit!3348 (_1!3019 lt!103691))) lt!104541)))

(declare-fun b!65861 () Bool)

(declare-fun res!54592 () Bool)

(assert (=> b!65861 (=> (not res!54592) (not e!43284))))

(assert (=> b!65861 (= res!54592 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!104541))))

(declare-fun b!65862 () Bool)

(declare-fun lt!104545 () (_ BitVec 64))

(assert (=> b!65862 (= e!43284 (bvsle lt!104541 (bvmul lt!104545 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65862 (or (= lt!104545 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!104545 #b0000000000000000000000000000000000000000000000000000000000001000) lt!104545)))))

(assert (=> b!65862 (= lt!104545 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103691)))))))

(assert (= (and d!20690 res!54591) b!65861))

(assert (= (and b!65861 res!54592) b!65862))

(declare-fun m!104571 () Bool)

(assert (=> d!20690 m!104571))

(declare-fun m!104573 () Bool)

(assert (=> d!20690 m!104573))

(assert (=> b!65491 d!20690))

(declare-fun d!20692 () Bool)

(assert (=> d!20692 (= (invariant!0 (currentBit!3348 (_2!3020 lt!103684)) (currentByte!3353 (_2!3020 lt!103684)) (size!1306 (buf!1687 (_2!3020 lt!103684)))) (and (bvsge (currentBit!3348 (_2!3020 lt!103684)) #b00000000000000000000000000000000) (bvslt (currentBit!3348 (_2!3020 lt!103684)) #b00000000000000000000000000001000) (bvsge (currentByte!3353 (_2!3020 lt!103684)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3353 (_2!3020 lt!103684)) (size!1306 (buf!1687 (_2!3020 lt!103684)))) (and (= (currentBit!3348 (_2!3020 lt!103684)) #b00000000000000000000000000000000) (= (currentByte!3353 (_2!3020 lt!103684)) (size!1306 (buf!1687 (_2!3020 lt!103684))))))))))

(assert (=> b!65490 d!20692))

(declare-fun d!20694 () Bool)

(assert (=> d!20694 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5037 () Bool)

(assert (= bs!5037 d!20694))

(declare-fun m!104575 () Bool)

(assert (=> bs!5037 m!104575))

(assert (=> b!65484 d!20694))

(declare-fun d!20696 () Bool)

(assert (=> d!20696 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))) ((_ sign_extend 32) (currentByte!3353 thiss!1379)) ((_ sign_extend 32) (currentBit!3348 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!104547 () Unit!4425)

(assert (=> d!20696 (= lt!104547 (choose!9 thiss!1379 (buf!1687 (_2!3020 lt!103685)) (bvsub to!314 i!635) (BitStream!2253 (buf!1687 (_2!3020 lt!103685)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379))))))

(assert (=> d!20696 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1687 (_2!3020 lt!103685)) (bvsub to!314 i!635)) lt!104547)))

(declare-fun bs!5038 () Bool)

(assert (= bs!5038 d!20696))

(assert (=> bs!5038 m!104005))

(declare-fun m!104577 () Bool)

(assert (=> bs!5038 m!104577))

(assert (=> b!65484 d!20696))

(declare-fun d!20698 () Bool)

(assert (=> d!20698 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) lt!103686) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684)))) lt!103686))))

(declare-fun bs!5039 () Bool)

(assert (= bs!5039 d!20698))

(declare-fun m!104579 () Bool)

(assert (=> bs!5039 m!104579))

(assert (=> b!65484 d!20698))

(declare-fun b!65863 () Bool)

(declare-fun res!54595 () Bool)

(declare-fun e!43285 () Bool)

(assert (=> b!65863 (=> (not res!54595) (not e!43285))))

(declare-fun lt!104565 () tuple2!5816)

(assert (=> b!65863 (= res!54595 (isPrefixOf!0 (_2!3019 lt!104565) (_2!3020 lt!103685)))))

(declare-fun lt!104564 () (_ BitVec 64))

(declare-fun b!65864 () Bool)

(declare-fun lt!104556 () (_ BitVec 64))

(assert (=> b!65864 (= e!43285 (= (_1!3019 lt!104565) (withMovedBitIndex!0 (_2!3019 lt!104565) (bvsub lt!104564 lt!104556))))))

(assert (=> b!65864 (or (= (bvand lt!104564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104556 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104564 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104564 lt!104556) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65864 (= lt!104556 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103685))) (currentByte!3353 (_2!3020 lt!103685)) (currentBit!3348 (_2!3020 lt!103685))))))

(assert (=> b!65864 (= lt!104564 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))))))

(declare-fun b!65865 () Bool)

(declare-fun res!54593 () Bool)

(assert (=> b!65865 (=> (not res!54593) (not e!43285))))

(assert (=> b!65865 (= res!54593 (isPrefixOf!0 (_1!3019 lt!104565) (_2!3020 lt!103684)))))

(declare-fun b!65867 () Bool)

(declare-fun e!43286 () Unit!4425)

(declare-fun lt!104553 () Unit!4425)

(assert (=> b!65867 (= e!43286 lt!104553)))

(declare-fun lt!104561 () (_ BitVec 64))

(assert (=> b!65867 (= lt!104561 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!104554 () (_ BitVec 64))

(assert (=> b!65867 (= lt!104554 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103684))) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))))))

(assert (=> b!65867 (= lt!104553 (arrayBitRangesEqSymmetric!0 (buf!1687 (_2!3020 lt!103684)) (buf!1687 (_2!3020 lt!103685)) lt!104561 lt!104554))))

(assert (=> b!65867 (arrayBitRangesEq!0 (buf!1687 (_2!3020 lt!103685)) (buf!1687 (_2!3020 lt!103684)) lt!104561 lt!104554)))

(declare-fun d!20700 () Bool)

(assert (=> d!20700 e!43285))

(declare-fun res!54594 () Bool)

(assert (=> d!20700 (=> (not res!54594) (not e!43285))))

(assert (=> d!20700 (= res!54594 (isPrefixOf!0 (_1!3019 lt!104565) (_2!3019 lt!104565)))))

(declare-fun lt!104550 () BitStream!2252)

(assert (=> d!20700 (= lt!104565 (tuple2!5817 lt!104550 (_2!3020 lt!103685)))))

(declare-fun lt!104555 () Unit!4425)

(declare-fun lt!104551 () Unit!4425)

(assert (=> d!20700 (= lt!104555 lt!104551)))

(assert (=> d!20700 (isPrefixOf!0 lt!104550 (_2!3020 lt!103685))))

(assert (=> d!20700 (= lt!104551 (lemmaIsPrefixTransitive!0 lt!104550 (_2!3020 lt!103685) (_2!3020 lt!103685)))))

(declare-fun lt!104558 () Unit!4425)

(declare-fun lt!104549 () Unit!4425)

(assert (=> d!20700 (= lt!104558 lt!104549)))

(assert (=> d!20700 (isPrefixOf!0 lt!104550 (_2!3020 lt!103685))))

(assert (=> d!20700 (= lt!104549 (lemmaIsPrefixTransitive!0 lt!104550 (_2!3020 lt!103684) (_2!3020 lt!103685)))))

(declare-fun lt!104563 () Unit!4425)

(assert (=> d!20700 (= lt!104563 e!43286)))

(declare-fun c!4782 () Bool)

(assert (=> d!20700 (= c!4782 (not (= (size!1306 (buf!1687 (_2!3020 lt!103684))) #b00000000000000000000000000000000)))))

(declare-fun lt!104559 () Unit!4425)

(declare-fun lt!104562 () Unit!4425)

(assert (=> d!20700 (= lt!104559 lt!104562)))

(assert (=> d!20700 (isPrefixOf!0 (_2!3020 lt!103685) (_2!3020 lt!103685))))

(assert (=> d!20700 (= lt!104562 (lemmaIsPrefixRefl!0 (_2!3020 lt!103685)))))

(declare-fun lt!104557 () Unit!4425)

(declare-fun lt!104566 () Unit!4425)

(assert (=> d!20700 (= lt!104557 lt!104566)))

(assert (=> d!20700 (= lt!104566 (lemmaIsPrefixRefl!0 (_2!3020 lt!103685)))))

(declare-fun lt!104560 () Unit!4425)

(declare-fun lt!104567 () Unit!4425)

(assert (=> d!20700 (= lt!104560 lt!104567)))

(assert (=> d!20700 (isPrefixOf!0 lt!104550 lt!104550)))

(assert (=> d!20700 (= lt!104567 (lemmaIsPrefixRefl!0 lt!104550))))

(declare-fun lt!104552 () Unit!4425)

(declare-fun lt!104548 () Unit!4425)

(assert (=> d!20700 (= lt!104552 lt!104548)))

(assert (=> d!20700 (isPrefixOf!0 (_2!3020 lt!103684) (_2!3020 lt!103684))))

(assert (=> d!20700 (= lt!104548 (lemmaIsPrefixRefl!0 (_2!3020 lt!103684)))))

(assert (=> d!20700 (= lt!104550 (BitStream!2253 (buf!1687 (_2!3020 lt!103685)) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684))))))

(assert (=> d!20700 (isPrefixOf!0 (_2!3020 lt!103684) (_2!3020 lt!103685))))

(assert (=> d!20700 (= (reader!0 (_2!3020 lt!103684) (_2!3020 lt!103685)) lt!104565)))

(declare-fun b!65866 () Bool)

(declare-fun Unit!4455 () Unit!4425)

(assert (=> b!65866 (= e!43286 Unit!4455)))

(assert (= (and d!20700 c!4782) b!65867))

(assert (= (and d!20700 (not c!4782)) b!65866))

(assert (= (and d!20700 res!54594) b!65865))

(assert (= (and b!65865 res!54593) b!65863))

(assert (= (and b!65863 res!54595) b!65864))

(declare-fun m!104581 () Bool)

(assert (=> b!65863 m!104581))

(assert (=> d!20700 m!103943))

(declare-fun m!104583 () Bool)

(assert (=> d!20700 m!104583))

(assert (=> d!20700 m!104449))

(declare-fun m!104585 () Bool)

(assert (=> d!20700 m!104585))

(declare-fun m!104587 () Bool)

(assert (=> d!20700 m!104587))

(declare-fun m!104589 () Bool)

(assert (=> d!20700 m!104589))

(declare-fun m!104591 () Bool)

(assert (=> d!20700 m!104591))

(assert (=> d!20700 m!104451))

(declare-fun m!104593 () Bool)

(assert (=> d!20700 m!104593))

(declare-fun m!104595 () Bool)

(assert (=> d!20700 m!104595))

(declare-fun m!104597 () Bool)

(assert (=> d!20700 m!104597))

(declare-fun m!104599 () Bool)

(assert (=> b!65864 m!104599))

(assert (=> b!65864 m!104015))

(assert (=> b!65864 m!103991))

(declare-fun m!104601 () Bool)

(assert (=> b!65865 m!104601))

(assert (=> b!65867 m!103991))

(declare-fun m!104603 () Bool)

(assert (=> b!65867 m!104603))

(declare-fun m!104605 () Bool)

(assert (=> b!65867 m!104605))

(assert (=> b!65484 d!20700))

(declare-fun b!65869 () Bool)

(declare-fun e!43288 () tuple2!5830)

(declare-fun lt!104569 () (_ BitVec 64))

(declare-fun lt!104570 () tuple2!5828)

(assert (=> b!65869 (= e!43288 (tuple2!5831 (Cons!697 (_1!3025 lt!104570) (bitStreamReadBitsIntoList!0 (_2!3020 lt!103685) (_2!3025 lt!104570) (bvsub (bvsub to!314 i!635) lt!104569))) (_2!3025 lt!104570)))))

(assert (=> b!65869 (= lt!104570 (readBit!0 (_1!3019 lt!103683)))))

(assert (=> b!65869 (= lt!104569 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!65871 () Bool)

(declare-fun e!43287 () Bool)

(declare-fun lt!104568 () List!701)

(assert (=> b!65871 (= e!43287 (> (length!329 lt!104568) 0))))

(declare-fun b!65868 () Bool)

(assert (=> b!65868 (= e!43288 (tuple2!5831 Nil!698 (_1!3019 lt!103683)))))

(declare-fun b!65870 () Bool)

(assert (=> b!65870 (= e!43287 (isEmpty!205 lt!104568))))

(declare-fun d!20702 () Bool)

(assert (=> d!20702 e!43287))

(declare-fun c!4783 () Bool)

(assert (=> d!20702 (= c!4783 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20702 (= lt!104568 (_1!3026 e!43288))))

(declare-fun c!4784 () Bool)

(assert (=> d!20702 (= c!4784 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20702 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20702 (= (bitStreamReadBitsIntoList!0 (_2!3020 lt!103685) (_1!3019 lt!103683) (bvsub to!314 i!635)) lt!104568)))

(assert (= (and d!20702 c!4784) b!65868))

(assert (= (and d!20702 (not c!4784)) b!65869))

(assert (= (and d!20702 c!4783) b!65870))

(assert (= (and d!20702 (not c!4783)) b!65871))

(declare-fun m!104607 () Bool)

(assert (=> b!65869 m!104607))

(declare-fun m!104609 () Bool)

(assert (=> b!65869 m!104609))

(declare-fun m!104611 () Bool)

(assert (=> b!65871 m!104611))

(declare-fun m!104613 () Bool)

(assert (=> b!65870 m!104613))

(assert (=> b!65484 d!20702))

(declare-fun b!65873 () Bool)

(declare-fun lt!104572 () (_ BitVec 64))

(declare-fun e!43290 () tuple2!5830)

(declare-fun lt!104573 () tuple2!5828)

(assert (=> b!65873 (= e!43290 (tuple2!5831 (Cons!697 (_1!3025 lt!104573) (bitStreamReadBitsIntoList!0 (_2!3020 lt!103685) (_2!3025 lt!104573) (bvsub lt!103686 lt!104572))) (_2!3025 lt!104573)))))

(assert (=> b!65873 (= lt!104573 (readBit!0 (_1!3019 lt!103691)))))

(assert (=> b!65873 (= lt!104572 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!65875 () Bool)

(declare-fun e!43289 () Bool)

(declare-fun lt!104571 () List!701)

(assert (=> b!65875 (= e!43289 (> (length!329 lt!104571) 0))))

(declare-fun b!65872 () Bool)

(assert (=> b!65872 (= e!43290 (tuple2!5831 Nil!698 (_1!3019 lt!103691)))))

(declare-fun b!65874 () Bool)

(assert (=> b!65874 (= e!43289 (isEmpty!205 lt!104571))))

(declare-fun d!20704 () Bool)

(assert (=> d!20704 e!43289))

(declare-fun c!4785 () Bool)

(assert (=> d!20704 (= c!4785 (= lt!103686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20704 (= lt!104571 (_1!3026 e!43290))))

(declare-fun c!4786 () Bool)

(assert (=> d!20704 (= c!4786 (= lt!103686 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!20704 (bvsge lt!103686 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!20704 (= (bitStreamReadBitsIntoList!0 (_2!3020 lt!103685) (_1!3019 lt!103691) lt!103686) lt!104571)))

(assert (= (and d!20704 c!4786) b!65872))

(assert (= (and d!20704 (not c!4786)) b!65873))

(assert (= (and d!20704 c!4785) b!65874))

(assert (= (and d!20704 (not c!4785)) b!65875))

(declare-fun m!104615 () Bool)

(assert (=> b!65873 m!104615))

(declare-fun m!104617 () Bool)

(assert (=> b!65873 m!104617))

(declare-fun m!104619 () Bool)

(assert (=> b!65875 m!104619))

(declare-fun m!104621 () Bool)

(assert (=> b!65874 m!104621))

(assert (=> b!65484 d!20704))

(declare-fun d!20706 () Bool)

(assert (=> d!20706 (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103684))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103684))) lt!103686)))

(declare-fun lt!104574 () Unit!4425)

(assert (=> d!20706 (= lt!104574 (choose!9 (_2!3020 lt!103684) (buf!1687 (_2!3020 lt!103685)) lt!103686 (BitStream!2253 (buf!1687 (_2!3020 lt!103685)) (currentByte!3353 (_2!3020 lt!103684)) (currentBit!3348 (_2!3020 lt!103684)))))))

(assert (=> d!20706 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3020 lt!103684) (buf!1687 (_2!3020 lt!103685)) lt!103686) lt!104574)))

(declare-fun bs!5040 () Bool)

(assert (= bs!5040 d!20706))

(assert (=> bs!5040 m!103999))

(declare-fun m!104623 () Bool)

(assert (=> bs!5040 m!104623))

(assert (=> b!65484 d!20706))

(declare-fun b!65876 () Bool)

(declare-fun res!54598 () Bool)

(declare-fun e!43291 () Bool)

(assert (=> b!65876 (=> (not res!54598) (not e!43291))))

(declare-fun lt!104592 () tuple2!5816)

(assert (=> b!65876 (= res!54598 (isPrefixOf!0 (_2!3019 lt!104592) (_2!3020 lt!103685)))))

(declare-fun lt!104591 () (_ BitVec 64))

(declare-fun lt!104583 () (_ BitVec 64))

(declare-fun b!65877 () Bool)

(assert (=> b!65877 (= e!43291 (= (_1!3019 lt!104592) (withMovedBitIndex!0 (_2!3019 lt!104592) (bvsub lt!104591 lt!104583))))))

(assert (=> b!65877 (or (= (bvand lt!104591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104583 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104591 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104591 lt!104583) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!65877 (= lt!104583 (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103685))) (currentByte!3353 (_2!3020 lt!103685)) (currentBit!3348 (_2!3020 lt!103685))))))

(assert (=> b!65877 (= lt!104591 (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)))))

(declare-fun b!65878 () Bool)

(declare-fun res!54596 () Bool)

(assert (=> b!65878 (=> (not res!54596) (not e!43291))))

(assert (=> b!65878 (= res!54596 (isPrefixOf!0 (_1!3019 lt!104592) thiss!1379))))

(declare-fun b!65880 () Bool)

(declare-fun e!43292 () Unit!4425)

(declare-fun lt!104580 () Unit!4425)

(assert (=> b!65880 (= e!43292 lt!104580)))

(declare-fun lt!104588 () (_ BitVec 64))

(assert (=> b!65880 (= lt!104588 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!104581 () (_ BitVec 64))

(assert (=> b!65880 (= lt!104581 (bitIndex!0 (size!1306 (buf!1687 thiss!1379)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)))))

(assert (=> b!65880 (= lt!104580 (arrayBitRangesEqSymmetric!0 (buf!1687 thiss!1379) (buf!1687 (_2!3020 lt!103685)) lt!104588 lt!104581))))

(assert (=> b!65880 (arrayBitRangesEq!0 (buf!1687 (_2!3020 lt!103685)) (buf!1687 thiss!1379) lt!104588 lt!104581)))

(declare-fun d!20708 () Bool)

(assert (=> d!20708 e!43291))

(declare-fun res!54597 () Bool)

(assert (=> d!20708 (=> (not res!54597) (not e!43291))))

(assert (=> d!20708 (= res!54597 (isPrefixOf!0 (_1!3019 lt!104592) (_2!3019 lt!104592)))))

(declare-fun lt!104577 () BitStream!2252)

(assert (=> d!20708 (= lt!104592 (tuple2!5817 lt!104577 (_2!3020 lt!103685)))))

(declare-fun lt!104582 () Unit!4425)

(declare-fun lt!104578 () Unit!4425)

(assert (=> d!20708 (= lt!104582 lt!104578)))

(assert (=> d!20708 (isPrefixOf!0 lt!104577 (_2!3020 lt!103685))))

(assert (=> d!20708 (= lt!104578 (lemmaIsPrefixTransitive!0 lt!104577 (_2!3020 lt!103685) (_2!3020 lt!103685)))))

(declare-fun lt!104585 () Unit!4425)

(declare-fun lt!104576 () Unit!4425)

(assert (=> d!20708 (= lt!104585 lt!104576)))

(assert (=> d!20708 (isPrefixOf!0 lt!104577 (_2!3020 lt!103685))))

(assert (=> d!20708 (= lt!104576 (lemmaIsPrefixTransitive!0 lt!104577 thiss!1379 (_2!3020 lt!103685)))))

(declare-fun lt!104590 () Unit!4425)

(assert (=> d!20708 (= lt!104590 e!43292)))

(declare-fun c!4787 () Bool)

(assert (=> d!20708 (= c!4787 (not (= (size!1306 (buf!1687 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!104586 () Unit!4425)

(declare-fun lt!104589 () Unit!4425)

(assert (=> d!20708 (= lt!104586 lt!104589)))

(assert (=> d!20708 (isPrefixOf!0 (_2!3020 lt!103685) (_2!3020 lt!103685))))

(assert (=> d!20708 (= lt!104589 (lemmaIsPrefixRefl!0 (_2!3020 lt!103685)))))

(declare-fun lt!104584 () Unit!4425)

(declare-fun lt!104593 () Unit!4425)

(assert (=> d!20708 (= lt!104584 lt!104593)))

(assert (=> d!20708 (= lt!104593 (lemmaIsPrefixRefl!0 (_2!3020 lt!103685)))))

(declare-fun lt!104587 () Unit!4425)

(declare-fun lt!104594 () Unit!4425)

(assert (=> d!20708 (= lt!104587 lt!104594)))

(assert (=> d!20708 (isPrefixOf!0 lt!104577 lt!104577)))

(assert (=> d!20708 (= lt!104594 (lemmaIsPrefixRefl!0 lt!104577))))

(declare-fun lt!104579 () Unit!4425)

(declare-fun lt!104575 () Unit!4425)

(assert (=> d!20708 (= lt!104579 lt!104575)))

(assert (=> d!20708 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!20708 (= lt!104575 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!20708 (= lt!104577 (BitStream!2253 (buf!1687 (_2!3020 lt!103685)) (currentByte!3353 thiss!1379) (currentBit!3348 thiss!1379)))))

(assert (=> d!20708 (isPrefixOf!0 thiss!1379 (_2!3020 lt!103685))))

(assert (=> d!20708 (= (reader!0 thiss!1379 (_2!3020 lt!103685)) lt!104592)))

(declare-fun b!65879 () Bool)

(declare-fun Unit!4456 () Unit!4425)

(assert (=> b!65879 (= e!43292 Unit!4456)))

(assert (= (and d!20708 c!4787) b!65880))

(assert (= (and d!20708 (not c!4787)) b!65879))

(assert (= (and d!20708 res!54597) b!65878))

(assert (= (and b!65878 res!54596) b!65876))

(assert (= (and b!65876 res!54598) b!65877))

(declare-fun m!104625 () Bool)

(assert (=> b!65876 m!104625))

(assert (=> d!20708 m!103947))

(declare-fun m!104627 () Bool)

(assert (=> d!20708 m!104627))

(assert (=> d!20708 m!104009))

(declare-fun m!104629 () Bool)

(assert (=> d!20708 m!104629))

(assert (=> d!20708 m!104587))

(declare-fun m!104631 () Bool)

(assert (=> d!20708 m!104631))

(assert (=> d!20708 m!104591))

(assert (=> d!20708 m!104011))

(declare-fun m!104633 () Bool)

(assert (=> d!20708 m!104633))

(declare-fun m!104635 () Bool)

(assert (=> d!20708 m!104635))

(declare-fun m!104637 () Bool)

(assert (=> d!20708 m!104637))

(declare-fun m!104639 () Bool)

(assert (=> b!65877 m!104639))

(assert (=> b!65877 m!104015))

(assert (=> b!65877 m!104013))

(declare-fun m!104641 () Bool)

(assert (=> b!65878 m!104641))

(assert (=> b!65880 m!104013))

(declare-fun m!104643 () Bool)

(assert (=> b!65880 m!104643))

(declare-fun m!104645 () Bool)

(assert (=> b!65880 m!104645))

(assert (=> b!65484 d!20708))

(declare-fun d!20710 () Bool)

(declare-fun e!43293 () Bool)

(assert (=> d!20710 e!43293))

(declare-fun res!54599 () Bool)

(assert (=> d!20710 (=> (not res!54599) (not e!43293))))

(declare-fun lt!104595 () (_ BitVec 64))

(declare-fun lt!104596 () (_ BitVec 64))

(declare-fun lt!104600 () (_ BitVec 64))

(assert (=> d!20710 (= res!54599 (= lt!104595 (bvsub lt!104596 lt!104600)))))

(assert (=> d!20710 (or (= (bvand lt!104596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!104600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!104596 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!104596 lt!104600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!20710 (= lt!104600 (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))) ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103685))) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103685)))))))

(declare-fun lt!104598 () (_ BitVec 64))

(declare-fun lt!104597 () (_ BitVec 64))

(assert (=> d!20710 (= lt!104596 (bvmul lt!104598 lt!104597))))

(assert (=> d!20710 (or (= lt!104598 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!104597 (bvsdiv (bvmul lt!104598 lt!104597) lt!104598)))))

(assert (=> d!20710 (= lt!104597 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!20710 (= lt!104598 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))))))

(assert (=> d!20710 (= lt!104595 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3353 (_2!3020 lt!103685))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3348 (_2!3020 lt!103685)))))))

(assert (=> d!20710 (invariant!0 (currentBit!3348 (_2!3020 lt!103685)) (currentByte!3353 (_2!3020 lt!103685)) (size!1306 (buf!1687 (_2!3020 lt!103685))))))

(assert (=> d!20710 (= (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103685))) (currentByte!3353 (_2!3020 lt!103685)) (currentBit!3348 (_2!3020 lt!103685))) lt!104595)))

(declare-fun b!65881 () Bool)

(declare-fun res!54600 () Bool)

(assert (=> b!65881 (=> (not res!54600) (not e!43293))))

(assert (=> b!65881 (= res!54600 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!104595))))

(declare-fun b!65882 () Bool)

(declare-fun lt!104599 () (_ BitVec 64))

(assert (=> b!65882 (= e!43293 (bvsle lt!104595 (bvmul lt!104599 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!65882 (or (= lt!104599 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!104599 #b0000000000000000000000000000000000000000000000000000000000001000) lt!104599)))))

(assert (=> b!65882 (= lt!104599 ((_ sign_extend 32) (size!1306 (buf!1687 (_2!3020 lt!103685)))))))

(assert (= (and d!20710 res!54599) b!65881))

(assert (= (and b!65881 res!54600) b!65882))

(declare-fun m!104647 () Bool)

(assert (=> d!20710 m!104647))

(assert (=> d!20710 m!103939))

(assert (=> b!65473 d!20710))

(declare-fun d!20712 () Bool)

(declare-fun res!54601 () Bool)

(declare-fun e!43295 () Bool)

(assert (=> d!20712 (=> (not res!54601) (not e!43295))))

(assert (=> d!20712 (= res!54601 (= (size!1306 (buf!1687 (_1!3019 lt!103691))) (size!1306 (buf!1687 (_2!3020 lt!103685)))))))

(assert (=> d!20712 (= (isPrefixOf!0 (_1!3019 lt!103691) (_2!3020 lt!103685)) e!43295)))

(declare-fun b!65883 () Bool)

(declare-fun res!54603 () Bool)

(assert (=> b!65883 (=> (not res!54603) (not e!43295))))

(assert (=> b!65883 (= res!54603 (bvsle (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103691))) (currentByte!3353 (_1!3019 lt!103691)) (currentBit!3348 (_1!3019 lt!103691))) (bitIndex!0 (size!1306 (buf!1687 (_2!3020 lt!103685))) (currentByte!3353 (_2!3020 lt!103685)) (currentBit!3348 (_2!3020 lt!103685)))))))

(declare-fun b!65884 () Bool)

(declare-fun e!43294 () Bool)

(assert (=> b!65884 (= e!43295 e!43294)))

(declare-fun res!54602 () Bool)

(assert (=> b!65884 (=> res!54602 e!43294)))

(assert (=> b!65884 (= res!54602 (= (size!1306 (buf!1687 (_1!3019 lt!103691))) #b00000000000000000000000000000000))))

(declare-fun b!65885 () Bool)

(assert (=> b!65885 (= e!43294 (arrayBitRangesEq!0 (buf!1687 (_1!3019 lt!103691)) (buf!1687 (_2!3020 lt!103685)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1306 (buf!1687 (_1!3019 lt!103691))) (currentByte!3353 (_1!3019 lt!103691)) (currentBit!3348 (_1!3019 lt!103691)))))))

(assert (= (and d!20712 res!54601) b!65883))

(assert (= (and b!65883 res!54603) b!65884))

(assert (= (and b!65884 (not res!54602)) b!65885))

(assert (=> b!65883 m!103957))

(assert (=> b!65883 m!104015))

(assert (=> b!65885 m!103957))

(assert (=> b!65885 m!103957))

(declare-fun m!104649 () Bool)

(assert (=> b!65885 m!104649))

(assert (=> b!65472 d!20712))

(declare-fun d!20714 () Bool)

(assert (=> d!20714 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103691)))) ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103691))) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103691))) lt!103686) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1306 (buf!1687 (_1!3019 lt!103691)))) ((_ sign_extend 32) (currentByte!3353 (_1!3019 lt!103691))) ((_ sign_extend 32) (currentBit!3348 (_1!3019 lt!103691)))) lt!103686))))

(declare-fun bs!5041 () Bool)

(assert (= bs!5041 d!20714))

(assert (=> bs!5041 m!104571))

(assert (=> b!65482 d!20714))

(push 1)

(assert (not b!65880))

(assert (not b!65611))

(assert (not b!65870))

(assert (not b!65732))

(assert (not b!65863))

(assert (not b!65603))

(assert (not d!20690))

(assert (not b!65885))

(assert (not b!65619))

(assert (not b!65616))

(assert (not b!65602))

(assert (not b!65824))

(assert (not b!65873))

(assert (not b!65842))

(assert (not b!65749))

(assert (not d!20628))

(assert (not b!65579))

(assert (not b!65820))

(assert (not b!65731))

(assert (not b!65814))

(assert (not d!20706))

(assert (not b!65846))

(assert (not b!65604))

(assert (not b!65727))

(assert (not d!20686))

(assert (not b!65869))

(assert (not d!20714))

(assert (not d!20682))

(assert (not b!65877))

(assert (not b!65875))

(assert (not d!20570))

(assert (not b!65865))

(assert (not d!20680))

(assert (not b!65864))

(assert (not d!20568))

(assert (not b!65825))

(assert (not d!20630))

(assert (not d!20694))

(assert (not b!65843))

(assert (not d!20708))

(assert (not b!65747))

(assert (not d!20634))

(assert (not b!65613))

(assert (not d!20700))

(assert (not d!20566))

(assert (not b!65614))

(assert (not b!65817))

(assert (not b!65883))

(assert (not b!65822))

(assert (not bm!838))

(assert (not d!20698))

(assert (not b!65844))

(assert (not b!65818))

(assert (not d!20684))

(assert (not b!65827))

(assert (not b!65730))

(assert (not b!65729))

(assert (not b!65815))

(assert (not d!20688))

(assert (not b!65871))

(assert (not b!65726))

(assert (not d!20640))

(assert (not b!65750))

(assert (not b!65728))

(assert (not d!20632))

(assert (not b!65867))

(assert (not b!65752))

(assert (not b!65876))

(assert (not b!65874))

(assert (not d!20636))

(assert (not b!65821))

(assert (not d!20696))

(assert (not d!20642))

(assert (not b!65725))

(assert (not d!20710))

(assert (not b!65878))

(assert (not d!20612))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

