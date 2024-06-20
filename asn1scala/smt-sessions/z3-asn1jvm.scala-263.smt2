; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5136 () Bool)

(assert start!5136)

(declare-fun res!17839 () Bool)

(declare-fun e!13835 () Bool)

(assert (=> start!5136 (=> (not res!17839) (not e!13835))))

(declare-datatypes ((array!1471 0))(
  ( (array!1472 (arr!1070 (Array (_ BitVec 32) (_ BitVec 8))) (size!626 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1471)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5136 (= res!17839 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!626 srcBuffer!2))))))))

(assert (=> start!5136 e!13835))

(assert (=> start!5136 true))

(declare-fun array_inv!596 (array!1471) Bool)

(assert (=> start!5136 (array_inv!596 srcBuffer!2)))

(declare-datatypes ((BitStream!1086 0))(
  ( (BitStream!1087 (buf!935 array!1471) (currentByte!2224 (_ BitVec 32)) (currentBit!2219 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1086)

(declare-fun e!13833 () Bool)

(declare-fun inv!12 (BitStream!1086) Bool)

(assert (=> start!5136 (and (inv!12 thiss!1379) e!13833)))

(declare-fun b!20538 () Bool)

(declare-fun e!13831 () Bool)

(assert (=> b!20538 (= e!13831 (or (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0111111111111111111111111111111111111111111111111111111111111111)))))

(declare-fun e!13836 () Bool)

(assert (=> b!20538 e!13836))

(declare-fun res!17838 () Bool)

(assert (=> b!20538 (=> (not res!17838) (not e!13836))))

(declare-datatypes ((Unit!1805 0))(
  ( (Unit!1806) )
))
(declare-datatypes ((tuple2!2412 0))(
  ( (tuple2!2413 (_1!1291 Unit!1805) (_2!1291 BitStream!1086)) )
))
(declare-fun lt!29244 () tuple2!2412)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20538 (= res!17838 (validate_offset_bits!1 ((_ sign_extend 32) (size!626 (buf!935 (_2!1291 lt!29244)))) ((_ sign_extend 32) (currentByte!2224 thiss!1379)) ((_ sign_extend 32) (currentBit!2219 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29242 () Unit!1805)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1086 array!1471 (_ BitVec 64)) Unit!1805)

(assert (=> b!20538 (= lt!29242 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!935 (_2!1291 lt!29244)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2414 0))(
  ( (tuple2!2415 (_1!1292 BitStream!1086) (_2!1292 BitStream!1086)) )
))
(declare-fun lt!29241 () tuple2!2414)

(declare-fun reader!0 (BitStream!1086 BitStream!1086) tuple2!2414)

(assert (=> b!20538 (= lt!29241 (reader!0 thiss!1379 (_2!1291 lt!29244)))))

(declare-fun b!20539 () Bool)

(declare-datatypes ((List!244 0))(
  ( (Nil!241) (Cons!240 (h!359 Bool) (t!994 List!244)) )
))
(declare-fun head!81 (List!244) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1086 array!1471 (_ BitVec 64) (_ BitVec 64)) List!244)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1086 BitStream!1086 (_ BitVec 64)) List!244)

(assert (=> b!20539 (= e!13836 (= (head!81 (byteArrayBitContentToList!0 (_2!1291 lt!29244) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!81 (bitStreamReadBitsIntoList!0 (_2!1291 lt!29244) (_1!1292 lt!29241) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20540 () Bool)

(assert (=> b!20540 (= e!13833 (array_inv!596 (buf!935 thiss!1379)))))

(declare-fun b!20541 () Bool)

(declare-fun e!13832 () Bool)

(assert (=> b!20541 (= e!13835 (not e!13832))))

(declare-fun res!17837 () Bool)

(assert (=> b!20541 (=> res!17837 e!13832)))

(assert (=> b!20541 (= res!17837 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1086 BitStream!1086) Bool)

(assert (=> b!20541 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29240 () Unit!1805)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1086) Unit!1805)

(assert (=> b!20541 (= lt!29240 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29243 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20541 (= lt!29243 (bitIndex!0 (size!626 (buf!935 thiss!1379)) (currentByte!2224 thiss!1379) (currentBit!2219 thiss!1379)))))

(declare-fun b!20542 () Bool)

(assert (=> b!20542 (= e!13832 e!13831)))

(declare-fun res!17836 () Bool)

(assert (=> b!20542 (=> res!17836 e!13831)))

(assert (=> b!20542 (= res!17836 (not (isPrefixOf!0 thiss!1379 (_2!1291 lt!29244))))))

(assert (=> b!20542 (validate_offset_bits!1 ((_ sign_extend 32) (size!626 (buf!935 (_2!1291 lt!29244)))) ((_ sign_extend 32) (currentByte!2224 (_2!1291 lt!29244))) ((_ sign_extend 32) (currentBit!2219 (_2!1291 lt!29244))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29245 () Unit!1805)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1086 BitStream!1086 (_ BitVec 64) (_ BitVec 64)) Unit!1805)

(assert (=> b!20542 (= lt!29245 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1291 lt!29244) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1086 (_ BitVec 8) (_ BitVec 32)) tuple2!2412)

(assert (=> b!20542 (= lt!29244 (appendBitFromByte!0 thiss!1379 (select (arr!1070 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20543 () Bool)

(declare-fun res!17840 () Bool)

(assert (=> b!20543 (=> (not res!17840) (not e!13835))))

(assert (=> b!20543 (= res!17840 (validate_offset_bits!1 ((_ sign_extend 32) (size!626 (buf!935 thiss!1379))) ((_ sign_extend 32) (currentByte!2224 thiss!1379)) ((_ sign_extend 32) (currentBit!2219 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5136 res!17839) b!20543))

(assert (= (and b!20543 res!17840) b!20541))

(assert (= (and b!20541 (not res!17837)) b!20542))

(assert (= (and b!20542 (not res!17836)) b!20538))

(assert (= (and b!20538 res!17838) b!20539))

(assert (= start!5136 b!20540))

(declare-fun m!27929 () Bool)

(assert (=> b!20543 m!27929))

(declare-fun m!27931 () Bool)

(assert (=> b!20539 m!27931))

(assert (=> b!20539 m!27931))

(declare-fun m!27933 () Bool)

(assert (=> b!20539 m!27933))

(declare-fun m!27935 () Bool)

(assert (=> b!20539 m!27935))

(assert (=> b!20539 m!27935))

(declare-fun m!27937 () Bool)

(assert (=> b!20539 m!27937))

(declare-fun m!27939 () Bool)

(assert (=> start!5136 m!27939))

(declare-fun m!27941 () Bool)

(assert (=> start!5136 m!27941))

(declare-fun m!27943 () Bool)

(assert (=> b!20540 m!27943))

(declare-fun m!27945 () Bool)

(assert (=> b!20541 m!27945))

(declare-fun m!27947 () Bool)

(assert (=> b!20541 m!27947))

(declare-fun m!27949 () Bool)

(assert (=> b!20541 m!27949))

(declare-fun m!27951 () Bool)

(assert (=> b!20542 m!27951))

(declare-fun m!27953 () Bool)

(assert (=> b!20542 m!27953))

(declare-fun m!27955 () Bool)

(assert (=> b!20542 m!27955))

(declare-fun m!27957 () Bool)

(assert (=> b!20542 m!27957))

(assert (=> b!20542 m!27953))

(declare-fun m!27959 () Bool)

(assert (=> b!20542 m!27959))

(declare-fun m!27961 () Bool)

(assert (=> b!20538 m!27961))

(declare-fun m!27963 () Bool)

(assert (=> b!20538 m!27963))

(declare-fun m!27965 () Bool)

(assert (=> b!20538 m!27965))

(check-sat (not b!20543) (not b!20542) (not start!5136) (not b!20539) (not b!20540) (not b!20541) (not b!20538))
(check-sat)
