; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5132 () Bool)

(assert start!5132)

(declare-fun b!20502 () Bool)

(declare-fun e!13788 () Bool)

(declare-fun e!13793 () Bool)

(assert (=> b!20502 (= e!13788 e!13793)))

(declare-fun res!17807 () Bool)

(assert (=> b!20502 (=> res!17807 e!13793)))

(declare-datatypes ((array!1467 0))(
  ( (array!1468 (arr!1068 (Array (_ BitVec 32) (_ BitVec 8))) (size!624 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1082 0))(
  ( (BitStream!1083 (buf!933 array!1467) (currentByte!2222 (_ BitVec 32)) (currentBit!2217 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1082)

(declare-datatypes ((Unit!1801 0))(
  ( (Unit!1802) )
))
(declare-datatypes ((tuple2!2404 0))(
  ( (tuple2!2405 (_1!1287 Unit!1801) (_2!1287 BitStream!1082)) )
))
(declare-fun lt!29207 () tuple2!2404)

(declare-fun isPrefixOf!0 (BitStream!1082 BitStream!1082) Bool)

(assert (=> b!20502 (= res!17807 (not (isPrefixOf!0 thiss!1379 (_2!1287 lt!29207))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20502 (validate_offset_bits!1 ((_ sign_extend 32) (size!624 (buf!933 (_2!1287 lt!29207)))) ((_ sign_extend 32) (currentByte!2222 (_2!1287 lt!29207))) ((_ sign_extend 32) (currentBit!2217 (_2!1287 lt!29207))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29208 () Unit!1801)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1082 BitStream!1082 (_ BitVec 64) (_ BitVec 64)) Unit!1801)

(assert (=> b!20502 (= lt!29208 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1287 lt!29207) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1467)

(declare-fun appendBitFromByte!0 (BitStream!1082 (_ BitVec 8) (_ BitVec 32)) tuple2!2404)

(assert (=> b!20502 (= lt!29207 (appendBitFromByte!0 thiss!1379 (select (arr!1068 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20503 () Bool)

(declare-fun e!13794 () Bool)

(assert (=> b!20503 (= e!13794 (not e!13788))))

(declare-fun res!17809 () Bool)

(assert (=> b!20503 (=> res!17809 e!13788)))

(assert (=> b!20503 (= res!17809 (bvsge i!635 to!314))))

(assert (=> b!20503 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29206 () Unit!1801)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1082) Unit!1801)

(assert (=> b!20503 (= lt!29206 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29205 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20503 (= lt!29205 (bitIndex!0 (size!624 (buf!933 thiss!1379)) (currentByte!2222 thiss!1379) (currentBit!2217 thiss!1379)))))

(declare-fun res!17806 () Bool)

(assert (=> start!5132 (=> (not res!17806) (not e!13794))))

(assert (=> start!5132 (= res!17806 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!624 srcBuffer!2))))))))

(assert (=> start!5132 e!13794))

(assert (=> start!5132 true))

(declare-fun array_inv!594 (array!1467) Bool)

(assert (=> start!5132 (array_inv!594 srcBuffer!2)))

(declare-fun e!13791 () Bool)

(declare-fun inv!12 (BitStream!1082) Bool)

(assert (=> start!5132 (and (inv!12 thiss!1379) e!13791)))

(declare-fun b!20504 () Bool)

(declare-fun res!17810 () Bool)

(assert (=> b!20504 (=> (not res!17810) (not e!13794))))

(assert (=> b!20504 (= res!17810 (validate_offset_bits!1 ((_ sign_extend 32) (size!624 (buf!933 thiss!1379))) ((_ sign_extend 32) (currentByte!2222 thiss!1379)) ((_ sign_extend 32) (currentBit!2217 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20505 () Bool)

(declare-fun e!13790 () Bool)

(declare-datatypes ((tuple2!2406 0))(
  ( (tuple2!2407 (_1!1288 BitStream!1082) (_2!1288 BitStream!1082)) )
))
(declare-fun lt!29209 () tuple2!2406)

(declare-datatypes ((List!242 0))(
  ( (Nil!239) (Cons!238 (h!357 Bool) (t!992 List!242)) )
))
(declare-fun head!79 (List!242) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1082 array!1467 (_ BitVec 64) (_ BitVec 64)) List!242)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1082 BitStream!1082 (_ BitVec 64)) List!242)

(assert (=> b!20505 (= e!13790 (= (head!79 (byteArrayBitContentToList!0 (_2!1287 lt!29207) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!79 (bitStreamReadBitsIntoList!0 (_2!1287 lt!29207) (_1!1288 lt!29209) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20506 () Bool)

(assert (=> b!20506 (= e!13791 (array_inv!594 (buf!933 thiss!1379)))))

(declare-fun b!20507 () Bool)

(assert (=> b!20507 (= e!13793 (or (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314))))))

(assert (=> b!20507 e!13790))

(declare-fun res!17808 () Bool)

(assert (=> b!20507 (=> (not res!17808) (not e!13790))))

(assert (=> b!20507 (= res!17808 (validate_offset_bits!1 ((_ sign_extend 32) (size!624 (buf!933 (_2!1287 lt!29207)))) ((_ sign_extend 32) (currentByte!2222 thiss!1379)) ((_ sign_extend 32) (currentBit!2217 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29204 () Unit!1801)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1082 array!1467 (_ BitVec 64)) Unit!1801)

(assert (=> b!20507 (= lt!29204 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!933 (_2!1287 lt!29207)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1082 BitStream!1082) tuple2!2406)

(assert (=> b!20507 (= lt!29209 (reader!0 thiss!1379 (_2!1287 lt!29207)))))

(assert (= (and start!5132 res!17806) b!20504))

(assert (= (and b!20504 res!17810) b!20503))

(assert (= (and b!20503 (not res!17809)) b!20502))

(assert (= (and b!20502 (not res!17807)) b!20507))

(assert (= (and b!20507 res!17808) b!20505))

(assert (= start!5132 b!20506))

(declare-fun m!27853 () Bool)

(assert (=> b!20505 m!27853))

(assert (=> b!20505 m!27853))

(declare-fun m!27855 () Bool)

(assert (=> b!20505 m!27855))

(declare-fun m!27857 () Bool)

(assert (=> b!20505 m!27857))

(assert (=> b!20505 m!27857))

(declare-fun m!27859 () Bool)

(assert (=> b!20505 m!27859))

(declare-fun m!27861 () Bool)

(assert (=> start!5132 m!27861))

(declare-fun m!27863 () Bool)

(assert (=> start!5132 m!27863))

(declare-fun m!27865 () Bool)

(assert (=> b!20507 m!27865))

(declare-fun m!27867 () Bool)

(assert (=> b!20507 m!27867))

(declare-fun m!27869 () Bool)

(assert (=> b!20507 m!27869))

(declare-fun m!27871 () Bool)

(assert (=> b!20503 m!27871))

(declare-fun m!27873 () Bool)

(assert (=> b!20503 m!27873))

(declare-fun m!27875 () Bool)

(assert (=> b!20503 m!27875))

(declare-fun m!27877 () Bool)

(assert (=> b!20504 m!27877))

(declare-fun m!27879 () Bool)

(assert (=> b!20506 m!27879))

(declare-fun m!27881 () Bool)

(assert (=> b!20502 m!27881))

(declare-fun m!27883 () Bool)

(assert (=> b!20502 m!27883))

(declare-fun m!27885 () Bool)

(assert (=> b!20502 m!27885))

(assert (=> b!20502 m!27881))

(declare-fun m!27887 () Bool)

(assert (=> b!20502 m!27887))

(declare-fun m!27889 () Bool)

(assert (=> b!20502 m!27889))

(push 1)

(assert (not b!20506))

(assert (not b!20504))

(assert (not b!20507))

(assert (not b!20502))

(assert (not b!20503))

(assert (not start!5132))

(assert (not b!20505))

(check-sat)

(pop 1)

(push 1)

(check-sat)

