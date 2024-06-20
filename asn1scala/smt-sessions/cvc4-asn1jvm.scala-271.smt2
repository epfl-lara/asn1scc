; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5378 () Bool)

(assert start!5378)

(declare-fun b!21701 () Bool)

(declare-fun res!18742 () Bool)

(declare-fun e!14715 () Bool)

(assert (=> b!21701 (=> res!18742 e!14715)))

(declare-datatypes ((array!1527 0))(
  ( (array!1528 (arr!1101 (Array (_ BitVec 32) (_ BitVec 8))) (size!651 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1136 0))(
  ( (BitStream!1137 (buf!966 array!1527) (currentByte!2267 (_ BitVec 32)) (currentBit!2262 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1896 0))(
  ( (Unit!1897) )
))
(declare-datatypes ((tuple2!2546 0))(
  ( (tuple2!2547 (_1!1358 Unit!1896) (_2!1358 BitStream!1136)) )
))
(declare-fun lt!31364 () tuple2!2546)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!21701 (= res!18742 (not (invariant!0 (currentBit!2262 (_2!1358 lt!31364)) (currentByte!2267 (_2!1358 lt!31364)) (size!651 (buf!966 (_2!1358 lt!31364))))))))

(declare-fun b!21702 () Bool)

(declare-fun e!14718 () Bool)

(declare-fun e!14717 () Bool)

(assert (=> b!21702 (= e!14718 (not e!14717))))

(declare-fun res!18739 () Bool)

(assert (=> b!21702 (=> res!18739 e!14717)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!21702 (= res!18739 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1136)

(declare-fun isPrefixOf!0 (BitStream!1136 BitStream!1136) Bool)

(assert (=> b!21702 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!31363 () Unit!1896)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1136) Unit!1896)

(assert (=> b!21702 (= lt!31363 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!31368 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!21702 (= lt!31368 (bitIndex!0 (size!651 (buf!966 thiss!1379)) (currentByte!2267 thiss!1379) (currentBit!2262 thiss!1379)))))

(declare-fun b!21703 () Bool)

(declare-fun e!14719 () Bool)

(assert (=> b!21703 (= e!14717 e!14719)))

(declare-fun res!18743 () Bool)

(assert (=> b!21703 (=> res!18743 e!14719)))

(declare-fun lt!31367 () tuple2!2546)

(assert (=> b!21703 (= res!18743 (not (isPrefixOf!0 thiss!1379 (_2!1358 lt!31367))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21703 (validate_offset_bits!1 ((_ sign_extend 32) (size!651 (buf!966 (_2!1358 lt!31367)))) ((_ sign_extend 32) (currentByte!2267 (_2!1358 lt!31367))) ((_ sign_extend 32) (currentBit!2262 (_2!1358 lt!31367))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31366 () Unit!1896)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1136 BitStream!1136 (_ BitVec 64) (_ BitVec 64)) Unit!1896)

(assert (=> b!21703 (= lt!31366 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1358 lt!31367) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1527)

(declare-fun appendBitFromByte!0 (BitStream!1136 (_ BitVec 8) (_ BitVec 32)) tuple2!2546)

(assert (=> b!21703 (= lt!31367 (appendBitFromByte!0 thiss!1379 (select (arr!1101 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!21704 () Bool)

(assert (=> b!21704 (= e!14715 true)))

(assert (=> b!21704 (= (size!651 (buf!966 (_2!1358 lt!31364))) (size!651 (buf!966 thiss!1379)))))

(declare-fun b!21705 () Bool)

(declare-fun e!14721 () Bool)

(declare-fun array_inv!621 (array!1527) Bool)

(assert (=> b!21705 (= e!14721 (array_inv!621 (buf!966 thiss!1379)))))

(declare-fun e!14716 () Bool)

(declare-datatypes ((tuple2!2548 0))(
  ( (tuple2!2549 (_1!1359 BitStream!1136) (_2!1359 BitStream!1136)) )
))
(declare-fun lt!31369 () tuple2!2548)

(declare-fun b!21706 () Bool)

(declare-datatypes ((List!269 0))(
  ( (Nil!266) (Cons!265 (h!384 Bool) (t!1019 List!269)) )
))
(declare-fun head!106 (List!269) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1136 array!1527 (_ BitVec 64) (_ BitVec 64)) List!269)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1136 BitStream!1136 (_ BitVec 64)) List!269)

(assert (=> b!21706 (= e!14716 (= (head!106 (byteArrayBitContentToList!0 (_2!1358 lt!31367) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!106 (bitStreamReadBitsIntoList!0 (_2!1358 lt!31367) (_1!1359 lt!31369) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!18745 () Bool)

(assert (=> start!5378 (=> (not res!18745) (not e!14718))))

(assert (=> start!5378 (= res!18745 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!651 srcBuffer!2))))))))

(assert (=> start!5378 e!14718))

(assert (=> start!5378 true))

(assert (=> start!5378 (array_inv!621 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1136) Bool)

(assert (=> start!5378 (and (inv!12 thiss!1379) e!14721)))

(declare-fun b!21707 () Bool)

(assert (=> b!21707 (= e!14719 e!14715)))

(declare-fun res!18740 () Bool)

(assert (=> b!21707 (=> res!18740 e!14715)))

(assert (=> b!21707 (= res!18740 (not (isPrefixOf!0 (_2!1358 lt!31367) (_2!1358 lt!31364))))))

(assert (=> b!21707 (isPrefixOf!0 thiss!1379 (_2!1358 lt!31364))))

(declare-fun lt!31365 () Unit!1896)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1136 BitStream!1136 BitStream!1136) Unit!1896)

(assert (=> b!21707 (= lt!31365 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1358 lt!31367) (_2!1358 lt!31364)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1136 array!1527 (_ BitVec 64) (_ BitVec 64)) tuple2!2546)

(assert (=> b!21707 (= lt!31364 (appendBitsMSBFirstLoop!0 (_2!1358 lt!31367) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!21707 e!14716))

(declare-fun res!18746 () Bool)

(assert (=> b!21707 (=> (not res!18746) (not e!14716))))

(assert (=> b!21707 (= res!18746 (validate_offset_bits!1 ((_ sign_extend 32) (size!651 (buf!966 (_2!1358 lt!31367)))) ((_ sign_extend 32) (currentByte!2267 thiss!1379)) ((_ sign_extend 32) (currentBit!2262 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31362 () Unit!1896)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1136 array!1527 (_ BitVec 64)) Unit!1896)

(assert (=> b!21707 (= lt!31362 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!966 (_2!1358 lt!31367)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1136 BitStream!1136) tuple2!2548)

(assert (=> b!21707 (= lt!31369 (reader!0 thiss!1379 (_2!1358 lt!31367)))))

(declare-fun b!21708 () Bool)

(declare-fun res!18744 () Bool)

(assert (=> b!21708 (=> res!18744 e!14715)))

(assert (=> b!21708 (= res!18744 (not (= (size!651 (buf!966 thiss!1379)) (size!651 (buf!966 (_2!1358 lt!31364))))))))

(declare-fun b!21709 () Bool)

(declare-fun res!18741 () Bool)

(assert (=> b!21709 (=> res!18741 e!14715)))

(assert (=> b!21709 (= res!18741 (not (= (bitIndex!0 (size!651 (buf!966 (_2!1358 lt!31364))) (currentByte!2267 (_2!1358 lt!31364)) (currentBit!2262 (_2!1358 lt!31364))) (bvsub (bvadd lt!31368 to!314) i!635))))))

(declare-fun b!21710 () Bool)

(declare-fun res!18738 () Bool)

(assert (=> b!21710 (=> (not res!18738) (not e!14718))))

(assert (=> b!21710 (= res!18738 (validate_offset_bits!1 ((_ sign_extend 32) (size!651 (buf!966 thiss!1379))) ((_ sign_extend 32) (currentByte!2267 thiss!1379)) ((_ sign_extend 32) (currentBit!2262 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5378 res!18745) b!21710))

(assert (= (and b!21710 res!18738) b!21702))

(assert (= (and b!21702 (not res!18739)) b!21703))

(assert (= (and b!21703 (not res!18743)) b!21707))

(assert (= (and b!21707 res!18746) b!21706))

(assert (= (and b!21707 (not res!18740)) b!21709))

(assert (= (and b!21709 (not res!18741)) b!21701))

(assert (= (and b!21701 (not res!18742)) b!21708))

(assert (= (and b!21708 (not res!18744)) b!21704))

(assert (= start!5378 b!21705))

(declare-fun m!30055 () Bool)

(assert (=> b!21710 m!30055))

(declare-fun m!30057 () Bool)

(assert (=> b!21705 m!30057))

(declare-fun m!30059 () Bool)

(assert (=> b!21703 m!30059))

(declare-fun m!30061 () Bool)

(assert (=> b!21703 m!30061))

(declare-fun m!30063 () Bool)

(assert (=> b!21703 m!30063))

(declare-fun m!30065 () Bool)

(assert (=> b!21703 m!30065))

(assert (=> b!21703 m!30061))

(declare-fun m!30067 () Bool)

(assert (=> b!21703 m!30067))

(declare-fun m!30069 () Bool)

(assert (=> b!21702 m!30069))

(declare-fun m!30071 () Bool)

(assert (=> b!21702 m!30071))

(declare-fun m!30073 () Bool)

(assert (=> b!21702 m!30073))

(declare-fun m!30075 () Bool)

(assert (=> b!21701 m!30075))

(declare-fun m!30077 () Bool)

(assert (=> start!5378 m!30077))

(declare-fun m!30079 () Bool)

(assert (=> start!5378 m!30079))

(declare-fun m!30081 () Bool)

(assert (=> b!21709 m!30081))

(declare-fun m!30083 () Bool)

(assert (=> b!21706 m!30083))

(assert (=> b!21706 m!30083))

(declare-fun m!30085 () Bool)

(assert (=> b!21706 m!30085))

(declare-fun m!30087 () Bool)

(assert (=> b!21706 m!30087))

(assert (=> b!21706 m!30087))

(declare-fun m!30089 () Bool)

(assert (=> b!21706 m!30089))

(declare-fun m!30091 () Bool)

(assert (=> b!21707 m!30091))

(declare-fun m!30093 () Bool)

(assert (=> b!21707 m!30093))

(declare-fun m!30095 () Bool)

(assert (=> b!21707 m!30095))

(declare-fun m!30097 () Bool)

(assert (=> b!21707 m!30097))

(declare-fun m!30099 () Bool)

(assert (=> b!21707 m!30099))

(declare-fun m!30101 () Bool)

(assert (=> b!21707 m!30101))

(declare-fun m!30103 () Bool)

(assert (=> b!21707 m!30103))

(push 1)

(assert (not b!21702))

(assert (not b!21701))

(assert (not b!21709))

(assert (not b!21710))

(assert (not b!21706))

(assert (not b!21707))

(assert (not start!5378))

(assert (not b!21705))

(assert (not b!21703))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

