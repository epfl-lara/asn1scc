; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5658 () Bool)

(assert start!5658)

(declare-fun b!23454 () Bool)

(declare-fun e!15883 () Bool)

(assert (=> b!23454 (= e!15883 true)))

(declare-datatypes ((array!1581 0))(
  ( (array!1582 (arr!1132 (Array (_ BitVec 32) (_ BitVec 8))) (size!676 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1184 0))(
  ( (BitStream!1185 (buf!997 array!1581) (currentByte!2310 (_ BitVec 32)) (currentBit!2305 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1995 0))(
  ( (Unit!1996) )
))
(declare-datatypes ((tuple2!2686 0))(
  ( (tuple2!2687 (_1!1430 Unit!1995) (_2!1430 BitStream!1184)) )
))
(declare-fun lt!33997 () tuple2!2686)

(declare-fun thiss!1379 () BitStream!1184)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23454 (validate_offset_bits!1 ((_ sign_extend 32) (size!676 (buf!997 (_2!1430 lt!33997)))) ((_ sign_extend 32) (currentByte!2310 thiss!1379)) ((_ sign_extend 32) (currentBit!2305 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!33996 () Unit!1995)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1184 array!1581 (_ BitVec 64)) Unit!1995)

(assert (=> b!23454 (= lt!33996 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!997 (_2!1430 lt!33997)) (bvsub to!314 i!635)))))

(declare-datatypes ((tuple2!2688 0))(
  ( (tuple2!2689 (_1!1431 BitStream!1184) (_2!1431 BitStream!1184)) )
))
(declare-fun lt!33988 () tuple2!2688)

(declare-fun reader!0 (BitStream!1184 BitStream!1184) tuple2!2688)

(assert (=> b!23454 (= lt!33988 (reader!0 thiss!1379 (_2!1430 lt!33997)))))

(declare-fun res!20180 () Bool)

(declare-fun e!15889 () Bool)

(assert (=> start!5658 (=> (not res!20180) (not e!15889))))

(declare-fun srcBuffer!2 () array!1581)

(assert (=> start!5658 (= res!20180 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!676 srcBuffer!2))))))))

(assert (=> start!5658 e!15889))

(assert (=> start!5658 true))

(declare-fun array_inv!645 (array!1581) Bool)

(assert (=> start!5658 (array_inv!645 srcBuffer!2)))

(declare-fun e!15881 () Bool)

(declare-fun inv!12 (BitStream!1184) Bool)

(assert (=> start!5658 (and (inv!12 thiss!1379) e!15881)))

(declare-fun lt!33990 () (_ BitVec 64))

(declare-fun e!15886 () Bool)

(declare-fun b!23455 () Bool)

(declare-fun lt!33995 () tuple2!2686)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23455 (= e!15886 (= lt!33990 (bvsub (bvsub (bvadd (bitIndex!0 (size!676 (buf!997 (_2!1430 lt!33995))) (currentByte!2310 (_2!1430 lt!33995)) (currentBit!2305 (_2!1430 lt!33995))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23456 () Bool)

(declare-fun e!15887 () Bool)

(declare-fun e!15880 () Bool)

(assert (=> b!23456 (= e!15887 e!15880)))

(declare-fun res!20175 () Bool)

(assert (=> b!23456 (=> res!20175 e!15880)))

(declare-fun isPrefixOf!0 (BitStream!1184 BitStream!1184) Bool)

(assert (=> b!23456 (= res!20175 (not (isPrefixOf!0 (_2!1430 lt!33995) (_2!1430 lt!33997))))))

(assert (=> b!23456 (isPrefixOf!0 thiss!1379 (_2!1430 lt!33997))))

(declare-fun lt!33989 () Unit!1995)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1184 BitStream!1184 BitStream!1184) Unit!1995)

(assert (=> b!23456 (= lt!33989 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1430 lt!33995) (_2!1430 lt!33997)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1184 array!1581 (_ BitVec 64) (_ BitVec 64)) tuple2!2686)

(assert (=> b!23456 (= lt!33997 (appendBitsMSBFirstLoop!0 (_2!1430 lt!33995) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!15882 () Bool)

(assert (=> b!23456 e!15882))

(declare-fun res!20183 () Bool)

(assert (=> b!23456 (=> (not res!20183) (not e!15882))))

(assert (=> b!23456 (= res!20183 (validate_offset_bits!1 ((_ sign_extend 32) (size!676 (buf!997 (_2!1430 lt!33995)))) ((_ sign_extend 32) (currentByte!2310 thiss!1379)) ((_ sign_extend 32) (currentBit!2305 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33987 () Unit!1995)

(assert (=> b!23456 (= lt!33987 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!997 (_2!1430 lt!33995)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33992 () tuple2!2688)

(assert (=> b!23456 (= lt!33992 (reader!0 thiss!1379 (_2!1430 lt!33995)))))

(declare-fun b!23457 () Bool)

(declare-fun res!20179 () Bool)

(assert (=> b!23457 (=> (not res!20179) (not e!15889))))

(assert (=> b!23457 (= res!20179 (validate_offset_bits!1 ((_ sign_extend 32) (size!676 (buf!997 thiss!1379))) ((_ sign_extend 32) (currentByte!2310 thiss!1379)) ((_ sign_extend 32) (currentBit!2305 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23458 () Bool)

(declare-fun res!20182 () Bool)

(declare-fun e!15879 () Bool)

(assert (=> b!23458 (=> res!20182 e!15879)))

(assert (=> b!23458 (= res!20182 (not (= (size!676 (buf!997 thiss!1379)) (size!676 (buf!997 (_2!1430 lt!33997))))))))

(declare-fun b!23459 () Bool)

(assert (=> b!23459 (= e!15881 (array_inv!645 (buf!997 thiss!1379)))))

(declare-fun b!23460 () Bool)

(assert (=> b!23460 (= e!15880 e!15879)))

(declare-fun res!20178 () Bool)

(assert (=> b!23460 (=> res!20178 e!15879)))

(declare-fun lt!33993 () (_ BitVec 64))

(assert (=> b!23460 (= res!20178 (not (= lt!33990 (bvsub (bvadd lt!33993 to!314) i!635))))))

(assert (=> b!23460 (= lt!33990 (bitIndex!0 (size!676 (buf!997 (_2!1430 lt!33997))) (currentByte!2310 (_2!1430 lt!33997)) (currentBit!2305 (_2!1430 lt!33997))))))

(declare-fun b!23461 () Bool)

(declare-fun res!20177 () Bool)

(assert (=> b!23461 (=> res!20177 e!15879)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23461 (= res!20177 (not (invariant!0 (currentBit!2305 (_2!1430 lt!33997)) (currentByte!2310 (_2!1430 lt!33997)) (size!676 (buf!997 (_2!1430 lt!33997))))))))

(declare-fun b!23462 () Bool)

(declare-fun e!15885 () Bool)

(assert (=> b!23462 (= e!15889 (not e!15885))))

(declare-fun res!20184 () Bool)

(assert (=> b!23462 (=> res!20184 e!15885)))

(assert (=> b!23462 (= res!20184 (bvsge i!635 to!314))))

(assert (=> b!23462 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!33991 () Unit!1995)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1184) Unit!1995)

(assert (=> b!23462 (= lt!33991 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23462 (= lt!33993 (bitIndex!0 (size!676 (buf!997 thiss!1379)) (currentByte!2310 thiss!1379) (currentBit!2305 thiss!1379)))))

(declare-fun b!23463 () Bool)

(declare-fun res!20181 () Bool)

(assert (=> b!23463 (=> res!20181 e!15883)))

(assert (=> b!23463 (= res!20181 (not (invariant!0 (currentBit!2305 (_2!1430 lt!33995)) (currentByte!2310 (_2!1430 lt!33995)) (size!676 (buf!997 (_2!1430 lt!33997))))))))

(declare-fun b!23464 () Bool)

(declare-fun res!20187 () Bool)

(assert (=> b!23464 (=> res!20187 e!15883)))

(assert (=> b!23464 (= res!20187 (not (invariant!0 (currentBit!2305 (_2!1430 lt!33995)) (currentByte!2310 (_2!1430 lt!33995)) (size!676 (buf!997 (_2!1430 lt!33995))))))))

(declare-fun b!23465 () Bool)

(declare-datatypes ((List!293 0))(
  ( (Nil!290) (Cons!289 (h!408 Bool) (t!1043 List!293)) )
))
(declare-fun head!130 (List!293) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1184 array!1581 (_ BitVec 64) (_ BitVec 64)) List!293)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1184 BitStream!1184 (_ BitVec 64)) List!293)

(assert (=> b!23465 (= e!15882 (= (head!130 (byteArrayBitContentToList!0 (_2!1430 lt!33995) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!130 (bitStreamReadBitsIntoList!0 (_2!1430 lt!33995) (_1!1431 lt!33992) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23466 () Bool)

(assert (=> b!23466 (= e!15879 e!15883)))

(declare-fun res!20186 () Bool)

(assert (=> b!23466 (=> res!20186 e!15883)))

(assert (=> b!23466 (= res!20186 (not (= (size!676 (buf!997 (_2!1430 lt!33995))) (size!676 (buf!997 (_2!1430 lt!33997))))))))

(assert (=> b!23466 e!15886))

(declare-fun res!20185 () Bool)

(assert (=> b!23466 (=> (not res!20185) (not e!15886))))

(assert (=> b!23466 (= res!20185 (= (size!676 (buf!997 (_2!1430 lt!33997))) (size!676 (buf!997 thiss!1379))))))

(declare-fun b!23467 () Bool)

(assert (=> b!23467 (= e!15885 e!15887)))

(declare-fun res!20176 () Bool)

(assert (=> b!23467 (=> res!20176 e!15887)))

(assert (=> b!23467 (= res!20176 (not (isPrefixOf!0 thiss!1379 (_2!1430 lt!33995))))))

(assert (=> b!23467 (validate_offset_bits!1 ((_ sign_extend 32) (size!676 (buf!997 (_2!1430 lt!33995)))) ((_ sign_extend 32) (currentByte!2310 (_2!1430 lt!33995))) ((_ sign_extend 32) (currentBit!2305 (_2!1430 lt!33995))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!33994 () Unit!1995)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1184 BitStream!1184 (_ BitVec 64) (_ BitVec 64)) Unit!1995)

(assert (=> b!23467 (= lt!33994 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1430 lt!33995) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1184 (_ BitVec 8) (_ BitVec 32)) tuple2!2686)

(assert (=> b!23467 (= lt!33995 (appendBitFromByte!0 thiss!1379 (select (arr!1132 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5658 res!20180) b!23457))

(assert (= (and b!23457 res!20179) b!23462))

(assert (= (and b!23462 (not res!20184)) b!23467))

(assert (= (and b!23467 (not res!20176)) b!23456))

(assert (= (and b!23456 res!20183) b!23465))

(assert (= (and b!23456 (not res!20175)) b!23460))

(assert (= (and b!23460 (not res!20178)) b!23461))

(assert (= (and b!23461 (not res!20177)) b!23458))

(assert (= (and b!23458 (not res!20182)) b!23466))

(assert (= (and b!23466 res!20185) b!23455))

(assert (= (and b!23466 (not res!20186)) b!23464))

(assert (= (and b!23464 (not res!20187)) b!23463))

(assert (= (and b!23463 (not res!20181)) b!23454))

(assert (= start!5658 b!23459))

(declare-fun m!32959 () Bool)

(assert (=> start!5658 m!32959))

(declare-fun m!32961 () Bool)

(assert (=> start!5658 m!32961))

(declare-fun m!32963 () Bool)

(assert (=> b!23463 m!32963))

(declare-fun m!32965 () Bool)

(assert (=> b!23455 m!32965))

(declare-fun m!32967 () Bool)

(assert (=> b!23460 m!32967))

(declare-fun m!32969 () Bool)

(assert (=> b!23467 m!32969))

(declare-fun m!32971 () Bool)

(assert (=> b!23467 m!32971))

(declare-fun m!32973 () Bool)

(assert (=> b!23467 m!32973))

(declare-fun m!32975 () Bool)

(assert (=> b!23467 m!32975))

(assert (=> b!23467 m!32969))

(declare-fun m!32977 () Bool)

(assert (=> b!23467 m!32977))

(declare-fun m!32979 () Bool)

(assert (=> b!23457 m!32979))

(declare-fun m!32981 () Bool)

(assert (=> b!23462 m!32981))

(declare-fun m!32983 () Bool)

(assert (=> b!23462 m!32983))

(declare-fun m!32985 () Bool)

(assert (=> b!23462 m!32985))

(declare-fun m!32987 () Bool)

(assert (=> b!23465 m!32987))

(assert (=> b!23465 m!32987))

(declare-fun m!32989 () Bool)

(assert (=> b!23465 m!32989))

(declare-fun m!32991 () Bool)

(assert (=> b!23465 m!32991))

(assert (=> b!23465 m!32991))

(declare-fun m!32993 () Bool)

(assert (=> b!23465 m!32993))

(declare-fun m!32995 () Bool)

(assert (=> b!23456 m!32995))

(declare-fun m!32997 () Bool)

(assert (=> b!23456 m!32997))

(declare-fun m!32999 () Bool)

(assert (=> b!23456 m!32999))

(declare-fun m!33001 () Bool)

(assert (=> b!23456 m!33001))

(declare-fun m!33003 () Bool)

(assert (=> b!23456 m!33003))

(declare-fun m!33005 () Bool)

(assert (=> b!23456 m!33005))

(declare-fun m!33007 () Bool)

(assert (=> b!23456 m!33007))

(declare-fun m!33009 () Bool)

(assert (=> b!23461 m!33009))

(declare-fun m!33011 () Bool)

(assert (=> b!23459 m!33011))

(declare-fun m!33013 () Bool)

(assert (=> b!23454 m!33013))

(declare-fun m!33015 () Bool)

(assert (=> b!23454 m!33015))

(declare-fun m!33017 () Bool)

(assert (=> b!23454 m!33017))

(declare-fun m!33019 () Bool)

(assert (=> b!23464 m!33019))

(push 1)

(assert (not b!23459))

(assert (not b!23464))

(assert (not start!5658))

(assert (not b!23454))

(assert (not b!23467))

(assert (not b!23461))

(assert (not b!23465))

(assert (not b!23455))

(assert (not b!23457))

(assert (not b!23460))

(assert (not b!23462))

(assert (not b!23463))

(assert (not b!23456))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

