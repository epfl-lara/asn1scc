; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11162 () Bool)

(assert start!11162)

(declare-fun b!55352 () Bool)

(declare-fun e!36885 () Bool)

(declare-fun e!36884 () Bool)

(assert (=> b!55352 (= e!36885 e!36884)))

(declare-fun res!46104 () Bool)

(assert (=> b!55352 (=> res!46104 e!36884)))

(declare-datatypes ((array!2577 0))(
  ( (array!2578 (arr!1719 (Array (_ BitVec 32) (_ BitVec 8))) (size!1173 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2034 0))(
  ( (BitStream!2035 (buf!1536 array!2577) (currentByte!3118 (_ BitVec 32)) (currentBit!3113 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3825 0))(
  ( (Unit!3826) )
))
(declare-datatypes ((tuple2!5046 0))(
  ( (tuple2!5047 (_1!2634 Unit!3825) (_2!2634 BitStream!2034)) )
))
(declare-fun lt!86428 () tuple2!5046)

(declare-fun lt!86424 () tuple2!5046)

(declare-fun isPrefixOf!0 (BitStream!2034 BitStream!2034) Bool)

(assert (=> b!55352 (= res!46104 (not (isPrefixOf!0 (_2!2634 lt!86428) (_2!2634 lt!86424))))))

(declare-fun thiss!1379 () BitStream!2034)

(assert (=> b!55352 (isPrefixOf!0 thiss!1379 (_2!2634 lt!86424))))

(declare-fun lt!86423 () Unit!3825)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2034 BitStream!2034 BitStream!2034) Unit!3825)

(assert (=> b!55352 (= lt!86423 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2634 lt!86428) (_2!2634 lt!86424)))))

(declare-fun srcBuffer!2 () array!2577)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2034 array!2577 (_ BitVec 64) (_ BitVec 64)) tuple2!5046)

(assert (=> b!55352 (= lt!86424 (appendBitsMSBFirstLoop!0 (_2!2634 lt!86428) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!36887 () Bool)

(assert (=> b!55352 e!36887))

(declare-fun res!46109 () Bool)

(assert (=> b!55352 (=> (not res!46109) (not e!36887))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55352 (= res!46109 (validate_offset_bits!1 ((_ sign_extend 32) (size!1173 (buf!1536 (_2!2634 lt!86428)))) ((_ sign_extend 32) (currentByte!3118 thiss!1379)) ((_ sign_extend 32) (currentBit!3113 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86425 () Unit!3825)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2034 array!2577 (_ BitVec 64)) Unit!3825)

(assert (=> b!55352 (= lt!86425 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1536 (_2!2634 lt!86428)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5048 0))(
  ( (tuple2!5049 (_1!2635 BitStream!2034) (_2!2635 BitStream!2034)) )
))
(declare-fun lt!86427 () tuple2!5048)

(declare-fun reader!0 (BitStream!2034 BitStream!2034) tuple2!5048)

(assert (=> b!55352 (= lt!86427 (reader!0 thiss!1379 (_2!2634 lt!86428)))))

(declare-fun b!55353 () Bool)

(declare-fun res!46106 () Bool)

(assert (=> b!55353 (=> res!46106 e!36884)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!55353 (= res!46106 (not (invariant!0 (currentBit!3113 (_2!2634 lt!86424)) (currentByte!3118 (_2!2634 lt!86424)) (size!1173 (buf!1536 (_2!2634 lt!86424))))))))

(declare-fun b!55354 () Bool)

(declare-datatypes ((List!592 0))(
  ( (Nil!589) (Cons!588 (h!707 Bool) (t!1342 List!592)) )
))
(declare-fun head!411 (List!592) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2034 array!2577 (_ BitVec 64) (_ BitVec 64)) List!592)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2034 BitStream!2034 (_ BitVec 64)) List!592)

(assert (=> b!55354 (= e!36887 (= (head!411 (byteArrayBitContentToList!0 (_2!2634 lt!86428) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!411 (bitStreamReadBitsIntoList!0 (_2!2634 lt!86428) (_1!2635 lt!86427) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!55355 () Bool)

(declare-fun res!46107 () Bool)

(assert (=> b!55355 (=> res!46107 e!36884)))

(declare-fun lt!86421 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!55355 (= res!46107 (not (= (bitIndex!0 (size!1173 (buf!1536 (_2!2634 lt!86424))) (currentByte!3118 (_2!2634 lt!86424)) (currentBit!3113 (_2!2634 lt!86424))) (bvsub (bvadd lt!86421 to!314) i!635))))))

(declare-fun b!55356 () Bool)

(declare-fun res!46110 () Bool)

(declare-fun e!36883 () Bool)

(assert (=> b!55356 (=> (not res!46110) (not e!36883))))

(assert (=> b!55356 (= res!46110 (validate_offset_bits!1 ((_ sign_extend 32) (size!1173 (buf!1536 thiss!1379))) ((_ sign_extend 32) (currentByte!3118 thiss!1379)) ((_ sign_extend 32) (currentBit!3113 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!55357 () Bool)

(assert (=> b!55357 (= e!36884 (or (not (= (size!1173 (buf!1536 thiss!1379)) (size!1173 (buf!1536 (_2!2634 lt!86424))))) (= (size!1173 (buf!1536 (_2!2634 lt!86424))) (size!1173 (buf!1536 thiss!1379)))))))

(declare-fun b!55358 () Bool)

(declare-fun e!36886 () Bool)

(assert (=> b!55358 (= e!36886 e!36885)))

(declare-fun res!46108 () Bool)

(assert (=> b!55358 (=> res!46108 e!36885)))

(assert (=> b!55358 (= res!46108 (not (isPrefixOf!0 thiss!1379 (_2!2634 lt!86428))))))

(assert (=> b!55358 (validate_offset_bits!1 ((_ sign_extend 32) (size!1173 (buf!1536 (_2!2634 lt!86428)))) ((_ sign_extend 32) (currentByte!3118 (_2!2634 lt!86428))) ((_ sign_extend 32) (currentBit!3113 (_2!2634 lt!86428))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86422 () Unit!3825)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2034 BitStream!2034 (_ BitVec 64) (_ BitVec 64)) Unit!3825)

(assert (=> b!55358 (= lt!86422 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2634 lt!86428) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2034 (_ BitVec 8) (_ BitVec 32)) tuple2!5046)

(assert (=> b!55358 (= lt!86428 (appendBitFromByte!0 thiss!1379 (select (arr!1719 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!55359 () Bool)

(assert (=> b!55359 (= e!36883 (not e!36886))))

(declare-fun res!46103 () Bool)

(assert (=> b!55359 (=> res!46103 e!36886)))

(assert (=> b!55359 (= res!46103 (bvsge i!635 to!314))))

(assert (=> b!55359 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!86426 () Unit!3825)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2034) Unit!3825)

(assert (=> b!55359 (= lt!86426 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!55359 (= lt!86421 (bitIndex!0 (size!1173 (buf!1536 thiss!1379)) (currentByte!3118 thiss!1379) (currentBit!3113 thiss!1379)))))

(declare-fun b!55360 () Bool)

(declare-fun e!36880 () Bool)

(declare-fun array_inv!1076 (array!2577) Bool)

(assert (=> b!55360 (= e!36880 (array_inv!1076 (buf!1536 thiss!1379)))))

(declare-fun res!46105 () Bool)

(assert (=> start!11162 (=> (not res!46105) (not e!36883))))

(assert (=> start!11162 (= res!46105 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1173 srcBuffer!2))))))))

(assert (=> start!11162 e!36883))

(assert (=> start!11162 true))

(assert (=> start!11162 (array_inv!1076 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2034) Bool)

(assert (=> start!11162 (and (inv!12 thiss!1379) e!36880)))

(assert (= (and start!11162 res!46105) b!55356))

(assert (= (and b!55356 res!46110) b!55359))

(assert (= (and b!55359 (not res!46103)) b!55358))

(assert (= (and b!55358 (not res!46108)) b!55352))

(assert (= (and b!55352 res!46109) b!55354))

(assert (= (and b!55352 (not res!46104)) b!55355))

(assert (= (and b!55355 (not res!46107)) b!55353))

(assert (= (and b!55353 (not res!46106)) b!55357))

(assert (= start!11162 b!55360))

(declare-fun m!87183 () Bool)

(assert (=> b!55360 m!87183))

(declare-fun m!87185 () Bool)

(assert (=> start!11162 m!87185))

(declare-fun m!87187 () Bool)

(assert (=> start!11162 m!87187))

(declare-fun m!87189 () Bool)

(assert (=> b!55353 m!87189))

(declare-fun m!87191 () Bool)

(assert (=> b!55352 m!87191))

(declare-fun m!87193 () Bool)

(assert (=> b!55352 m!87193))

(declare-fun m!87195 () Bool)

(assert (=> b!55352 m!87195))

(declare-fun m!87197 () Bool)

(assert (=> b!55352 m!87197))

(declare-fun m!87199 () Bool)

(assert (=> b!55352 m!87199))

(declare-fun m!87201 () Bool)

(assert (=> b!55352 m!87201))

(declare-fun m!87203 () Bool)

(assert (=> b!55352 m!87203))

(declare-fun m!87205 () Bool)

(assert (=> b!55359 m!87205))

(declare-fun m!87207 () Bool)

(assert (=> b!55359 m!87207))

(declare-fun m!87209 () Bool)

(assert (=> b!55359 m!87209))

(declare-fun m!87211 () Bool)

(assert (=> b!55356 m!87211))

(declare-fun m!87213 () Bool)

(assert (=> b!55354 m!87213))

(assert (=> b!55354 m!87213))

(declare-fun m!87215 () Bool)

(assert (=> b!55354 m!87215))

(declare-fun m!87217 () Bool)

(assert (=> b!55354 m!87217))

(assert (=> b!55354 m!87217))

(declare-fun m!87219 () Bool)

(assert (=> b!55354 m!87219))

(declare-fun m!87221 () Bool)

(assert (=> b!55355 m!87221))

(declare-fun m!87223 () Bool)

(assert (=> b!55358 m!87223))

(declare-fun m!87225 () Bool)

(assert (=> b!55358 m!87225))

(declare-fun m!87227 () Bool)

(assert (=> b!55358 m!87227))

(assert (=> b!55358 m!87223))

(declare-fun m!87229 () Bool)

(assert (=> b!55358 m!87229))

(declare-fun m!87231 () Bool)

(assert (=> b!55358 m!87231))

(check-sat (not b!55360) (not b!55359) (not b!55356) (not b!55355) (not start!11162) (not b!55353) (not b!55352) (not b!55358) (not b!55354))
