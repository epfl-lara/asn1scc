; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5374 () Bool)

(assert start!5374)

(declare-fun b!21641 () Bool)

(declare-fun res!18689 () Bool)

(declare-fun e!14672 () Bool)

(assert (=> b!21641 (=> res!18689 e!14672)))

(declare-datatypes ((array!1523 0))(
  ( (array!1524 (arr!1099 (Array (_ BitVec 32) (_ BitVec 8))) (size!649 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1132 0))(
  ( (BitStream!1133 (buf!964 array!1523) (currentByte!2265 (_ BitVec 32)) (currentBit!2260 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1132)

(declare-datatypes ((Unit!1892 0))(
  ( (Unit!1893) )
))
(declare-datatypes ((tuple2!2538 0))(
  ( (tuple2!2539 (_1!1354 Unit!1892) (_2!1354 BitStream!1132)) )
))
(declare-fun lt!31319 () tuple2!2538)

(assert (=> b!21641 (= res!18689 (not (= (size!649 (buf!964 thiss!1379)) (size!649 (buf!964 (_2!1354 lt!31319))))))))

(declare-fun srcBuffer!2 () array!1523)

(declare-fun lt!31315 () tuple2!2538)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!21642 () Bool)

(declare-fun e!14671 () Bool)

(declare-datatypes ((tuple2!2540 0))(
  ( (tuple2!2541 (_1!1355 BitStream!1132) (_2!1355 BitStream!1132)) )
))
(declare-fun lt!31320 () tuple2!2540)

(declare-datatypes ((List!267 0))(
  ( (Nil!264) (Cons!263 (h!382 Bool) (t!1017 List!267)) )
))
(declare-fun head!104 (List!267) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1132 array!1523 (_ BitVec 64) (_ BitVec 64)) List!267)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1132 BitStream!1132 (_ BitVec 64)) List!267)

(assert (=> b!21642 (= e!14671 (= (head!104 (byteArrayBitContentToList!0 (_2!1354 lt!31315) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!104 (bitStreamReadBitsIntoList!0 (_2!1354 lt!31315) (_1!1355 lt!31320) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!21644 () Bool)

(declare-fun res!18690 () Bool)

(assert (=> b!21644 (=> res!18690 e!14672)))

(declare-fun lt!31321 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!21644 (= res!18690 (not (= (bitIndex!0 (size!649 (buf!964 (_2!1354 lt!31319))) (currentByte!2265 (_2!1354 lt!31319)) (currentBit!2260 (_2!1354 lt!31319))) (bvsub (bvadd lt!31321 to!314) i!635))))))

(declare-fun b!21645 () Bool)

(declare-fun e!14666 () Bool)

(assert (=> b!21645 (= e!14666 e!14672)))

(declare-fun res!18686 () Bool)

(assert (=> b!21645 (=> res!18686 e!14672)))

(declare-fun isPrefixOf!0 (BitStream!1132 BitStream!1132) Bool)

(assert (=> b!21645 (= res!18686 (not (isPrefixOf!0 (_2!1354 lt!31315) (_2!1354 lt!31319))))))

(assert (=> b!21645 (isPrefixOf!0 thiss!1379 (_2!1354 lt!31319))))

(declare-fun lt!31316 () Unit!1892)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1132 BitStream!1132 BitStream!1132) Unit!1892)

(assert (=> b!21645 (= lt!31316 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1354 lt!31315) (_2!1354 lt!31319)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1132 array!1523 (_ BitVec 64) (_ BitVec 64)) tuple2!2538)

(assert (=> b!21645 (= lt!31319 (appendBitsMSBFirstLoop!0 (_2!1354 lt!31315) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!21645 e!14671))

(declare-fun res!18685 () Bool)

(assert (=> b!21645 (=> (not res!18685) (not e!14671))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21645 (= res!18685 (validate_offset_bits!1 ((_ sign_extend 32) (size!649 (buf!964 (_2!1354 lt!31315)))) ((_ sign_extend 32) (currentByte!2265 thiss!1379)) ((_ sign_extend 32) (currentBit!2260 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31317 () Unit!1892)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1132 array!1523 (_ BitVec 64)) Unit!1892)

(assert (=> b!21645 (= lt!31317 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!964 (_2!1354 lt!31315)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1132 BitStream!1132) tuple2!2540)

(assert (=> b!21645 (= lt!31320 (reader!0 thiss!1379 (_2!1354 lt!31315)))))

(declare-fun b!21646 () Bool)

(declare-fun res!18691 () Bool)

(declare-fun e!14669 () Bool)

(assert (=> b!21646 (=> (not res!18691) (not e!14669))))

(assert (=> b!21646 (= res!18691 (validate_offset_bits!1 ((_ sign_extend 32) (size!649 (buf!964 thiss!1379))) ((_ sign_extend 32) (currentByte!2265 thiss!1379)) ((_ sign_extend 32) (currentBit!2260 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!21643 () Bool)

(declare-fun res!18684 () Bool)

(assert (=> b!21643 (=> res!18684 e!14672)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!21643 (= res!18684 (not (invariant!0 (currentBit!2260 (_2!1354 lt!31319)) (currentByte!2265 (_2!1354 lt!31319)) (size!649 (buf!964 (_2!1354 lt!31319))))))))

(declare-fun res!18688 () Bool)

(assert (=> start!5374 (=> (not res!18688) (not e!14669))))

(assert (=> start!5374 (= res!18688 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!649 srcBuffer!2))))))))

(assert (=> start!5374 e!14669))

(assert (=> start!5374 true))

(declare-fun array_inv!619 (array!1523) Bool)

(assert (=> start!5374 (array_inv!619 srcBuffer!2)))

(declare-fun e!14667 () Bool)

(declare-fun inv!12 (BitStream!1132) Bool)

(assert (=> start!5374 (and (inv!12 thiss!1379) e!14667)))

(declare-fun b!21647 () Bool)

(assert (=> b!21647 (= e!14672 true)))

(assert (=> b!21647 (= (size!649 (buf!964 (_2!1354 lt!31319))) (size!649 (buf!964 thiss!1379)))))

(declare-fun b!21648 () Bool)

(assert (=> b!21648 (= e!14667 (array_inv!619 (buf!964 thiss!1379)))))

(declare-fun b!21649 () Bool)

(declare-fun e!14670 () Bool)

(assert (=> b!21649 (= e!14670 e!14666)))

(declare-fun res!18687 () Bool)

(assert (=> b!21649 (=> res!18687 e!14666)))

(assert (=> b!21649 (= res!18687 (not (isPrefixOf!0 thiss!1379 (_2!1354 lt!31315))))))

(assert (=> b!21649 (validate_offset_bits!1 ((_ sign_extend 32) (size!649 (buf!964 (_2!1354 lt!31315)))) ((_ sign_extend 32) (currentByte!2265 (_2!1354 lt!31315))) ((_ sign_extend 32) (currentBit!2260 (_2!1354 lt!31315))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31318 () Unit!1892)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1132 BitStream!1132 (_ BitVec 64) (_ BitVec 64)) Unit!1892)

(assert (=> b!21649 (= lt!31318 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1354 lt!31315) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1132 (_ BitVec 8) (_ BitVec 32)) tuple2!2538)

(assert (=> b!21649 (= lt!31315 (appendBitFromByte!0 thiss!1379 (select (arr!1099 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!21650 () Bool)

(assert (=> b!21650 (= e!14669 (not e!14670))))

(declare-fun res!18692 () Bool)

(assert (=> b!21650 (=> res!18692 e!14670)))

(assert (=> b!21650 (= res!18692 (bvsge i!635 to!314))))

(assert (=> b!21650 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!31314 () Unit!1892)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1132) Unit!1892)

(assert (=> b!21650 (= lt!31314 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!21650 (= lt!31321 (bitIndex!0 (size!649 (buf!964 thiss!1379)) (currentByte!2265 thiss!1379) (currentBit!2260 thiss!1379)))))

(assert (= (and start!5374 res!18688) b!21646))

(assert (= (and b!21646 res!18691) b!21650))

(assert (= (and b!21650 (not res!18692)) b!21649))

(assert (= (and b!21649 (not res!18687)) b!21645))

(assert (= (and b!21645 res!18685) b!21642))

(assert (= (and b!21645 (not res!18686)) b!21644))

(assert (= (and b!21644 (not res!18690)) b!21643))

(assert (= (and b!21643 (not res!18684)) b!21641))

(assert (= (and b!21641 (not res!18689)) b!21647))

(assert (= start!5374 b!21648))

(declare-fun m!29955 () Bool)

(assert (=> b!21642 m!29955))

(assert (=> b!21642 m!29955))

(declare-fun m!29957 () Bool)

(assert (=> b!21642 m!29957))

(declare-fun m!29959 () Bool)

(assert (=> b!21642 m!29959))

(assert (=> b!21642 m!29959))

(declare-fun m!29961 () Bool)

(assert (=> b!21642 m!29961))

(declare-fun m!29963 () Bool)

(assert (=> b!21650 m!29963))

(declare-fun m!29965 () Bool)

(assert (=> b!21650 m!29965))

(declare-fun m!29967 () Bool)

(assert (=> b!21650 m!29967))

(declare-fun m!29969 () Bool)

(assert (=> start!5374 m!29969))

(declare-fun m!29971 () Bool)

(assert (=> start!5374 m!29971))

(declare-fun m!29973 () Bool)

(assert (=> b!21643 m!29973))

(declare-fun m!29975 () Bool)

(assert (=> b!21648 m!29975))

(declare-fun m!29977 () Bool)

(assert (=> b!21646 m!29977))

(declare-fun m!29979 () Bool)

(assert (=> b!21645 m!29979))

(declare-fun m!29981 () Bool)

(assert (=> b!21645 m!29981))

(declare-fun m!29983 () Bool)

(assert (=> b!21645 m!29983))

(declare-fun m!29985 () Bool)

(assert (=> b!21645 m!29985))

(declare-fun m!29987 () Bool)

(assert (=> b!21645 m!29987))

(declare-fun m!29989 () Bool)

(assert (=> b!21645 m!29989))

(declare-fun m!29991 () Bool)

(assert (=> b!21645 m!29991))

(declare-fun m!29993 () Bool)

(assert (=> b!21649 m!29993))

(assert (=> b!21649 m!29993))

(declare-fun m!29995 () Bool)

(assert (=> b!21649 m!29995))

(declare-fun m!29997 () Bool)

(assert (=> b!21649 m!29997))

(declare-fun m!29999 () Bool)

(assert (=> b!21649 m!29999))

(declare-fun m!30001 () Bool)

(assert (=> b!21649 m!30001))

(declare-fun m!30003 () Bool)

(assert (=> b!21644 m!30003))

(push 1)

