; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5484 () Bool)

(assert start!5484)

(declare-fun b!22184 () Bool)

(declare-fun res!19120 () Bool)

(declare-fun e!15006 () Bool)

(assert (=> b!22184 (=> res!19120 e!15006)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!32304 () (_ BitVec 64))

(declare-datatypes ((array!1540 0))(
  ( (array!1541 (arr!1109 (Array (_ BitVec 32) (_ BitVec 8))) (size!656 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1146 0))(
  ( (BitStream!1147 (buf!974 array!1540) (currentByte!2281 (_ BitVec 32)) (currentBit!2276 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1922 0))(
  ( (Unit!1923) )
))
(declare-datatypes ((tuple2!2586 0))(
  ( (tuple2!2587 (_1!1378 Unit!1922) (_2!1378 BitStream!1146)) )
))
(declare-fun lt!32307 () tuple2!2586)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!22184 (= res!19120 (not (= (bitIndex!0 (size!656 (buf!974 (_2!1378 lt!32307))) (currentByte!2281 (_2!1378 lt!32307)) (currentBit!2276 (_2!1378 lt!32307))) (bvsub (bvadd lt!32304 to!314) i!635))))))

(declare-fun b!22185 () Bool)

(declare-fun e!15002 () Bool)

(declare-fun thiss!1379 () BitStream!1146)

(declare-fun array_inv!626 (array!1540) Bool)

(assert (=> b!22185 (= e!15002 (array_inv!626 (buf!974 thiss!1379)))))

(declare-fun b!22186 () Bool)

(declare-fun e!15001 () Bool)

(declare-fun e!15005 () Bool)

(assert (=> b!22186 (= e!15001 e!15005)))

(declare-fun res!19113 () Bool)

(assert (=> b!22186 (=> res!19113 e!15005)))

(declare-fun lt!32303 () tuple2!2586)

(declare-fun isPrefixOf!0 (BitStream!1146 BitStream!1146) Bool)

(assert (=> b!22186 (= res!19113 (not (isPrefixOf!0 thiss!1379 (_2!1378 lt!32303))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!22186 (validate_offset_bits!1 ((_ sign_extend 32) (size!656 (buf!974 (_2!1378 lt!32303)))) ((_ sign_extend 32) (currentByte!2281 (_2!1378 lt!32303))) ((_ sign_extend 32) (currentBit!2276 (_2!1378 lt!32303))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32305 () Unit!1922)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1146 BitStream!1146 (_ BitVec 64) (_ BitVec 64)) Unit!1922)

(assert (=> b!22186 (= lt!32305 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1378 lt!32303) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1540)

(declare-fun appendBitFromByte!0 (BitStream!1146 (_ BitVec 8) (_ BitVec 32)) tuple2!2586)

(assert (=> b!22186 (= lt!32303 (appendBitFromByte!0 thiss!1379 (select (arr!1109 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!22187 () Bool)

(declare-fun e!15003 () Bool)

(assert (=> b!22187 (= e!15003 (not e!15001))))

(declare-fun res!19121 () Bool)

(assert (=> b!22187 (=> res!19121 e!15001)))

(assert (=> b!22187 (= res!19121 (bvsge i!635 to!314))))

(assert (=> b!22187 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!32306 () Unit!1922)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1146) Unit!1922)

(assert (=> b!22187 (= lt!32306 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!22187 (= lt!32304 (bitIndex!0 (size!656 (buf!974 thiss!1379)) (currentByte!2281 thiss!1379) (currentBit!2276 thiss!1379)))))

(declare-fun b!22188 () Bool)

(declare-datatypes ((tuple2!2588 0))(
  ( (tuple2!2589 (_1!1379 BitStream!1146) (_2!1379 BitStream!1146)) )
))
(declare-fun lt!32302 () tuple2!2588)

(declare-fun e!15004 () Bool)

(declare-datatypes ((List!274 0))(
  ( (Nil!271) (Cons!270 (h!389 Bool) (t!1024 List!274)) )
))
(declare-fun head!111 (List!274) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1146 array!1540 (_ BitVec 64) (_ BitVec 64)) List!274)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1146 BitStream!1146 (_ BitVec 64)) List!274)

(assert (=> b!22188 (= e!15004 (= (head!111 (byteArrayBitContentToList!0 (_2!1378 lt!32303) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!111 (bitStreamReadBitsIntoList!0 (_2!1378 lt!32303) (_1!1379 lt!32302) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!22189 () Bool)

(assert (=> b!22189 (= e!15006 true)))

(assert (=> b!22189 (= (size!656 (buf!974 (_2!1378 lt!32307))) (size!656 (buf!974 thiss!1379)))))

(declare-fun b!22190 () Bool)

(assert (=> b!22190 (= e!15005 e!15006)))

(declare-fun res!19116 () Bool)

(assert (=> b!22190 (=> res!19116 e!15006)))

(assert (=> b!22190 (= res!19116 (not (isPrefixOf!0 (_2!1378 lt!32303) (_2!1378 lt!32307))))))

(assert (=> b!22190 (isPrefixOf!0 thiss!1379 (_2!1378 lt!32307))))

(declare-fun lt!32308 () Unit!1922)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1146 BitStream!1146 BitStream!1146) Unit!1922)

(assert (=> b!22190 (= lt!32308 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1378 lt!32303) (_2!1378 lt!32307)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1146 array!1540 (_ BitVec 64) (_ BitVec 64)) tuple2!2586)

(assert (=> b!22190 (= lt!32307 (appendBitsMSBFirstLoop!0 (_2!1378 lt!32303) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!22190 e!15004))

(declare-fun res!19114 () Bool)

(assert (=> b!22190 (=> (not res!19114) (not e!15004))))

(assert (=> b!22190 (= res!19114 (validate_offset_bits!1 ((_ sign_extend 32) (size!656 (buf!974 (_2!1378 lt!32303)))) ((_ sign_extend 32) (currentByte!2281 thiss!1379)) ((_ sign_extend 32) (currentBit!2276 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!32301 () Unit!1922)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1146 array!1540 (_ BitVec 64)) Unit!1922)

(assert (=> b!22190 (= lt!32301 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!974 (_2!1378 lt!32303)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1146 BitStream!1146) tuple2!2588)

(assert (=> b!22190 (= lt!32302 (reader!0 thiss!1379 (_2!1378 lt!32303)))))

(declare-fun b!22192 () Bool)

(declare-fun res!19119 () Bool)

(assert (=> b!22192 (=> res!19119 e!15006)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!22192 (= res!19119 (not (invariant!0 (currentBit!2276 (_2!1378 lt!32307)) (currentByte!2281 (_2!1378 lt!32307)) (size!656 (buf!974 (_2!1378 lt!32307))))))))

(declare-fun b!22193 () Bool)

(declare-fun res!19117 () Bool)

(assert (=> b!22193 (=> (not res!19117) (not e!15003))))

(assert (=> b!22193 (= res!19117 (validate_offset_bits!1 ((_ sign_extend 32) (size!656 (buf!974 thiss!1379))) ((_ sign_extend 32) (currentByte!2281 thiss!1379)) ((_ sign_extend 32) (currentBit!2276 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!19118 () Bool)

(assert (=> start!5484 (=> (not res!19118) (not e!15003))))

(assert (=> start!5484 (= res!19118 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!656 srcBuffer!2))))))))

(assert (=> start!5484 e!15003))

(assert (=> start!5484 true))

(assert (=> start!5484 (array_inv!626 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1146) Bool)

(assert (=> start!5484 (and (inv!12 thiss!1379) e!15002)))

(declare-fun b!22191 () Bool)

(declare-fun res!19115 () Bool)

(assert (=> b!22191 (=> res!19115 e!15006)))

(assert (=> b!22191 (= res!19115 (not (= (size!656 (buf!974 thiss!1379)) (size!656 (buf!974 (_2!1378 lt!32307))))))))

(assert (= (and start!5484 res!19118) b!22193))

(assert (= (and b!22193 res!19117) b!22187))

(assert (= (and b!22187 (not res!19121)) b!22186))

(assert (= (and b!22186 (not res!19113)) b!22190))

(assert (= (and b!22190 res!19114) b!22188))

(assert (= (and b!22190 (not res!19116)) b!22184))

(assert (= (and b!22184 (not res!19120)) b!22192))

(assert (= (and b!22192 (not res!19119)) b!22191))

(assert (= (and b!22191 (not res!19115)) b!22189))

(assert (= start!5484 b!22185))

(declare-fun m!30839 () Bool)

(assert (=> b!22186 m!30839))

(declare-fun m!30841 () Bool)

(assert (=> b!22186 m!30841))

(declare-fun m!30843 () Bool)

(assert (=> b!22186 m!30843))

(declare-fun m!30845 () Bool)

(assert (=> b!22186 m!30845))

(declare-fun m!30847 () Bool)

(assert (=> b!22186 m!30847))

(assert (=> b!22186 m!30839))

(declare-fun m!30849 () Bool)

(assert (=> b!22187 m!30849))

(declare-fun m!30851 () Bool)

(assert (=> b!22187 m!30851))

(declare-fun m!30853 () Bool)

(assert (=> b!22187 m!30853))

(declare-fun m!30855 () Bool)

(assert (=> b!22185 m!30855))

(declare-fun m!30857 () Bool)

(assert (=> b!22190 m!30857))

(declare-fun m!30859 () Bool)

(assert (=> b!22190 m!30859))

(declare-fun m!30861 () Bool)

(assert (=> b!22190 m!30861))

(declare-fun m!30863 () Bool)

(assert (=> b!22190 m!30863))

(declare-fun m!30865 () Bool)

(assert (=> b!22190 m!30865))

(declare-fun m!30867 () Bool)

(assert (=> b!22190 m!30867))

(declare-fun m!30869 () Bool)

(assert (=> b!22190 m!30869))

(declare-fun m!30871 () Bool)

(assert (=> b!22193 m!30871))

(declare-fun m!30873 () Bool)

(assert (=> b!22192 m!30873))

(declare-fun m!30875 () Bool)

(assert (=> start!5484 m!30875))

(declare-fun m!30877 () Bool)

(assert (=> start!5484 m!30877))

(declare-fun m!30879 () Bool)

(assert (=> b!22188 m!30879))

(assert (=> b!22188 m!30879))

(declare-fun m!30881 () Bool)

(assert (=> b!22188 m!30881))

(declare-fun m!30883 () Bool)

(assert (=> b!22188 m!30883))

(assert (=> b!22188 m!30883))

(declare-fun m!30885 () Bool)

(assert (=> b!22188 m!30885))

(declare-fun m!30887 () Bool)

(assert (=> b!22184 m!30887))

(check-sat (not b!22193) (not b!22184) (not b!22192) (not start!5484) (not b!22185) (not b!22186) (not b!22187) (not b!22188) (not b!22190))
