; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20600 () Bool)

(assert start!20600)

(declare-fun b!104065 () Bool)

(declare-fun e!68160 () Bool)

(declare-fun e!68158 () Bool)

(assert (=> b!104065 (= e!68160 e!68158)))

(declare-fun res!85670 () Bool)

(assert (=> b!104065 (=> (not res!85670) (not e!68158))))

(declare-datatypes ((array!4858 0))(
  ( (array!4859 (arr!2810 (Array (_ BitVec 32) (_ BitVec 8))) (size!2217 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3908 0))(
  ( (BitStream!3909 (buf!2583 array!4858) (currentByte!5068 (_ BitVec 32)) (currentBit!5063 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3908)

(declare-fun lt!152446 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!104065 (= res!85670 (validate_offset_bits!1 ((_ sign_extend 32) (size!2217 (buf!2583 thiss!1305))) ((_ sign_extend 32) (currentByte!5068 thiss!1305)) ((_ sign_extend 32) (currentBit!5063 thiss!1305)) lt!152446))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!104065 (= lt!152446 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!85676 () Bool)

(assert (=> start!20600 (=> (not res!85676) (not e!68160))))

(assert (=> start!20600 (= res!85676 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20600 e!68160))

(assert (=> start!20600 true))

(declare-fun e!68156 () Bool)

(declare-fun inv!12 (BitStream!3908) Bool)

(assert (=> start!20600 (and (inv!12 thiss!1305) e!68156)))

(declare-fun b!104066 () Bool)

(declare-fun res!85675 () Bool)

(declare-fun e!68165 () Bool)

(assert (=> b!104066 (=> res!85675 e!68165)))

(declare-datatypes ((tuple2!8582 0))(
  ( (tuple2!8583 (_1!4546 BitStream!3908) (_2!4546 BitStream!3908)) )
))
(declare-fun lt!152445 () tuple2!8582)

(assert (=> b!104066 (= res!85675 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2217 (buf!2583 (_1!4546 lt!152445)))) ((_ sign_extend 32) (currentByte!5068 (_1!4546 lt!152445))) ((_ sign_extend 32) (currentBit!5063 (_1!4546 lt!152445))) lt!152446)))))

(declare-fun b!104067 () Bool)

(declare-fun res!85664 () Bool)

(assert (=> b!104067 (=> res!85664 e!68165)))

(declare-fun lt!152447 () (_ BitVec 64))

(declare-fun lt!152450 () (_ BitVec 64))

(declare-fun lt!152449 () (_ BitVec 64))

(assert (=> b!104067 (= res!85664 (or (not (= (bvand lt!152447 lt!152450) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand lt!152447 lt!152449) lt!152447))))))

(declare-fun b!104068 () Bool)

(declare-fun e!68157 () Bool)

(declare-datatypes ((Unit!6378 0))(
  ( (Unit!6379) )
))
(declare-datatypes ((tuple2!8584 0))(
  ( (tuple2!8585 (_1!4547 Unit!6378) (_2!4547 BitStream!3908)) )
))
(declare-fun lt!152458 () tuple2!8584)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!104068 (= e!68157 (invariant!0 (currentBit!5063 thiss!1305) (currentByte!5068 thiss!1305) (size!2217 (buf!2583 (_2!4547 lt!152458)))))))

(declare-fun b!104069 () Bool)

(declare-fun e!68161 () Bool)

(declare-fun e!68164 () Bool)

(assert (=> b!104069 (= e!68161 e!68164)))

(declare-fun res!85665 () Bool)

(assert (=> b!104069 (=> (not res!85665) (not e!68164))))

(declare-fun lt!152441 () (_ BitVec 64))

(declare-fun lt!152461 () (_ BitVec 64))

(assert (=> b!104069 (= res!85665 (= lt!152441 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!152461)))))

(declare-fun lt!152448 () tuple2!8584)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104069 (= lt!152441 (bitIndex!0 (size!2217 (buf!2583 (_2!4547 lt!152448))) (currentByte!5068 (_2!4547 lt!152448)) (currentBit!5063 (_2!4547 lt!152448))))))

(assert (=> b!104069 (= lt!152461 (bitIndex!0 (size!2217 (buf!2583 thiss!1305)) (currentByte!5068 thiss!1305) (currentBit!5063 thiss!1305)))))

(declare-fun b!104070 () Bool)

(declare-fun array_inv!2019 (array!4858) Bool)

(assert (=> b!104070 (= e!68156 (array_inv!2019 (buf!2583 thiss!1305)))))

(declare-fun b!104071 () Bool)

(declare-fun e!68166 () Bool)

(assert (=> b!104071 (= e!68166 (not e!68165))))

(declare-fun res!85674 () Bool)

(assert (=> b!104071 (=> res!85674 e!68165)))

(declare-fun lt!152454 () (_ BitVec 64))

(declare-fun lt!152442 () tuple2!8582)

(declare-datatypes ((tuple2!8586 0))(
  ( (tuple2!8587 (_1!4548 BitStream!3908) (_2!4548 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8586)

(assert (=> b!104071 (= res!85674 (not (= (_1!4548 (readNLeastSignificantBitsLoopPure!0 (_1!4546 lt!152442) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152454)) (_2!4546 lt!152442))))))

(declare-fun lt!152459 () (_ BitVec 64))

(assert (=> b!104071 (validate_offset_bits!1 ((_ sign_extend 32) (size!2217 (buf!2583 (_2!4547 lt!152458)))) ((_ sign_extend 32) (currentByte!5068 (_2!4547 lt!152448))) ((_ sign_extend 32) (currentBit!5063 (_2!4547 lt!152448))) lt!152459)))

(declare-fun lt!152451 () Unit!6378)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3908 array!4858 (_ BitVec 64)) Unit!6378)

(assert (=> b!104071 (= lt!152451 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4547 lt!152448) (buf!2583 (_2!4547 lt!152458)) lt!152459))))

(assert (=> b!104071 (= lt!152459 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!152456 () (_ BitVec 64))

(declare-datatypes ((tuple2!8588 0))(
  ( (tuple2!8589 (_1!4549 BitStream!3908) (_2!4549 Bool)) )
))
(declare-fun lt!152460 () tuple2!8588)

(assert (=> b!104071 (= lt!152454 (bvor lt!152447 (ite (_2!4549 lt!152460) lt!152456 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!152453 () tuple2!8586)

(assert (=> b!104071 (= lt!152453 (readNLeastSignificantBitsLoopPure!0 (_1!4546 lt!152445) nBits!396 i!615 lt!152447))))

(assert (=> b!104071 (validate_offset_bits!1 ((_ sign_extend 32) (size!2217 (buf!2583 (_2!4547 lt!152458)))) ((_ sign_extend 32) (currentByte!5068 thiss!1305)) ((_ sign_extend 32) (currentBit!5063 thiss!1305)) lt!152446)))

(declare-fun lt!152463 () Unit!6378)

(assert (=> b!104071 (= lt!152463 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2583 (_2!4547 lt!152458)) lt!152446))))

(declare-fun v!199 () (_ BitVec 64))

(assert (=> b!104071 (= lt!152447 (bvand v!199 (bvnot lt!152450)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!104071 (= lt!152450 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun lt!152444 () Bool)

(assert (=> b!104071 (= (_2!4549 lt!152460) lt!152444)))

(declare-fun readBitPure!0 (BitStream!3908) tuple2!8588)

(assert (=> b!104071 (= lt!152460 (readBitPure!0 (_1!4546 lt!152445)))))

(declare-fun reader!0 (BitStream!3908 BitStream!3908) tuple2!8582)

(assert (=> b!104071 (= lt!152442 (reader!0 (_2!4547 lt!152448) (_2!4547 lt!152458)))))

(assert (=> b!104071 (= lt!152445 (reader!0 thiss!1305 (_2!4547 lt!152458)))))

(declare-fun e!68163 () Bool)

(assert (=> b!104071 e!68163))

(declare-fun res!85671 () Bool)

(assert (=> b!104071 (=> (not res!85671) (not e!68163))))

(declare-fun lt!152452 () tuple2!8588)

(declare-fun lt!152443 () tuple2!8588)

(assert (=> b!104071 (= res!85671 (= (bitIndex!0 (size!2217 (buf!2583 (_1!4549 lt!152452))) (currentByte!5068 (_1!4549 lt!152452)) (currentBit!5063 (_1!4549 lt!152452))) (bitIndex!0 (size!2217 (buf!2583 (_1!4549 lt!152443))) (currentByte!5068 (_1!4549 lt!152443)) (currentBit!5063 (_1!4549 lt!152443)))))))

(declare-fun lt!152440 () Unit!6378)

(declare-fun lt!152462 () BitStream!3908)

(declare-fun readBitPrefixLemma!0 (BitStream!3908 BitStream!3908) Unit!6378)

(assert (=> b!104071 (= lt!152440 (readBitPrefixLemma!0 lt!152462 (_2!4547 lt!152458)))))

(assert (=> b!104071 (= lt!152443 (readBitPure!0 (BitStream!3909 (buf!2583 (_2!4547 lt!152458)) (currentByte!5068 thiss!1305) (currentBit!5063 thiss!1305))))))

(assert (=> b!104071 (= lt!152452 (readBitPure!0 lt!152462))))

(assert (=> b!104071 (= lt!152462 (BitStream!3909 (buf!2583 (_2!4547 lt!152448)) (currentByte!5068 thiss!1305) (currentBit!5063 thiss!1305)))))

(assert (=> b!104071 e!68157))

(declare-fun res!85666 () Bool)

(assert (=> b!104071 (=> (not res!85666) (not e!68157))))

(declare-fun isPrefixOf!0 (BitStream!3908 BitStream!3908) Bool)

(assert (=> b!104071 (= res!85666 (isPrefixOf!0 thiss!1305 (_2!4547 lt!152458)))))

(declare-fun lt!152455 () Unit!6378)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3908 BitStream!3908 BitStream!3908) Unit!6378)

(assert (=> b!104071 (= lt!152455 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4547 lt!152448) (_2!4547 lt!152458)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3908 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8584)

(assert (=> b!104071 (= lt!152458 (appendNLeastSignificantBitsLoop!0 (_2!4547 lt!152448) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!104071 e!68161))

(declare-fun res!85668 () Bool)

(assert (=> b!104071 (=> (not res!85668) (not e!68161))))

(assert (=> b!104071 (= res!85668 (= (size!2217 (buf!2583 thiss!1305)) (size!2217 (buf!2583 (_2!4547 lt!152448)))))))

(declare-fun appendBit!0 (BitStream!3908 Bool) tuple2!8584)

(assert (=> b!104071 (= lt!152448 (appendBit!0 thiss!1305 lt!152444))))

(assert (=> b!104071 (= lt!152444 (not (= (bvand v!199 lt!152456) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!104071 (= lt!152456 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!104072 () Bool)

(assert (=> b!104072 (= e!68163 (= (_2!4549 lt!152452) (_2!4549 lt!152443)))))

(declare-fun b!104073 () Bool)

(declare-fun res!85667 () Bool)

(assert (=> b!104073 (=> (not res!85667) (not e!68157))))

(assert (=> b!104073 (= res!85667 (invariant!0 (currentBit!5063 thiss!1305) (currentByte!5068 thiss!1305) (size!2217 (buf!2583 (_2!4547 lt!152448)))))))

(declare-fun b!104074 () Bool)

(declare-fun e!68159 () Bool)

(assert (=> b!104074 (= e!68164 e!68159)))

(declare-fun res!85673 () Bool)

(assert (=> b!104074 (=> (not res!85673) (not e!68159))))

(declare-fun lt!152457 () tuple2!8588)

(assert (=> b!104074 (= res!85673 (and (= (_2!4549 lt!152457) lt!152444) (= (_1!4549 lt!152457) (_2!4547 lt!152448))))))

(declare-fun readerFrom!0 (BitStream!3908 (_ BitVec 32) (_ BitVec 32)) BitStream!3908)

(assert (=> b!104074 (= lt!152457 (readBitPure!0 (readerFrom!0 (_2!4547 lt!152448) (currentBit!5063 thiss!1305) (currentByte!5068 thiss!1305))))))

(declare-fun b!104075 () Bool)

(assert (=> b!104075 (= e!68159 (= (bitIndex!0 (size!2217 (buf!2583 (_1!4549 lt!152457))) (currentByte!5068 (_1!4549 lt!152457)) (currentBit!5063 (_1!4549 lt!152457))) lt!152441))))

(declare-fun b!104076 () Bool)

(assert (=> b!104076 (= e!68158 e!68166)))

(declare-fun res!85672 () Bool)

(assert (=> b!104076 (=> (not res!85672) (not e!68166))))

(assert (=> b!104076 (= res!85672 (and (= (bvand v!199 lt!152449) v!199) (bvslt i!615 nBits!396)))))

(assert (=> b!104076 (= lt!152449 (onesLSBLong!0 nBits!396))))

(declare-fun b!104077 () Bool)

(assert (=> b!104077 (= e!68165 true)))

(declare-fun lt!152464 () tuple2!8586)

(declare-fun withMovedBitIndex!0 (BitStream!3908 (_ BitVec 64)) BitStream!3908)

(assert (=> b!104077 (= lt!152464 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4546 lt!152445) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!152454))))

(declare-fun b!104078 () Bool)

(declare-fun res!85669 () Bool)

(assert (=> b!104078 (=> (not res!85669) (not e!68164))))

(assert (=> b!104078 (= res!85669 (isPrefixOf!0 thiss!1305 (_2!4547 lt!152448)))))

(assert (= (and start!20600 res!85676) b!104065))

(assert (= (and b!104065 res!85670) b!104076))

(assert (= (and b!104076 res!85672) b!104071))

(assert (= (and b!104071 res!85668) b!104069))

(assert (= (and b!104069 res!85665) b!104078))

(assert (= (and b!104078 res!85669) b!104074))

(assert (= (and b!104074 res!85673) b!104075))

(assert (= (and b!104071 res!85666) b!104073))

(assert (= (and b!104073 res!85667) b!104068))

(assert (= (and b!104071 res!85671) b!104072))

(assert (= (and b!104071 (not res!85674)) b!104066))

(assert (= (and b!104066 (not res!85675)) b!104067))

(assert (= (and b!104067 (not res!85664)) b!104077))

(assert (= start!20600 b!104070))

(declare-fun m!152045 () Bool)

(assert (=> b!104066 m!152045))

(declare-fun m!152047 () Bool)

(assert (=> b!104078 m!152047))

(declare-fun m!152049 () Bool)

(assert (=> b!104068 m!152049))

(declare-fun m!152051 () Bool)

(assert (=> b!104073 m!152051))

(declare-fun m!152053 () Bool)

(assert (=> b!104070 m!152053))

(declare-fun m!152055 () Bool)

(assert (=> start!20600 m!152055))

(declare-fun m!152057 () Bool)

(assert (=> b!104074 m!152057))

(assert (=> b!104074 m!152057))

(declare-fun m!152059 () Bool)

(assert (=> b!104074 m!152059))

(declare-fun m!152061 () Bool)

(assert (=> b!104075 m!152061))

(declare-fun m!152063 () Bool)

(assert (=> b!104076 m!152063))

(declare-fun m!152065 () Bool)

(assert (=> b!104069 m!152065))

(declare-fun m!152067 () Bool)

(assert (=> b!104069 m!152067))

(declare-fun m!152069 () Bool)

(assert (=> b!104065 m!152069))

(declare-fun m!152071 () Bool)

(assert (=> b!104077 m!152071))

(assert (=> b!104077 m!152071))

(declare-fun m!152073 () Bool)

(assert (=> b!104077 m!152073))

(declare-fun m!152075 () Bool)

(assert (=> b!104071 m!152075))

(declare-fun m!152077 () Bool)

(assert (=> b!104071 m!152077))

(declare-fun m!152079 () Bool)

(assert (=> b!104071 m!152079))

(declare-fun m!152081 () Bool)

(assert (=> b!104071 m!152081))

(declare-fun m!152083 () Bool)

(assert (=> b!104071 m!152083))

(declare-fun m!152085 () Bool)

(assert (=> b!104071 m!152085))

(declare-fun m!152087 () Bool)

(assert (=> b!104071 m!152087))

(declare-fun m!152089 () Bool)

(assert (=> b!104071 m!152089))

(declare-fun m!152091 () Bool)

(assert (=> b!104071 m!152091))

(declare-fun m!152093 () Bool)

(assert (=> b!104071 m!152093))

(declare-fun m!152095 () Bool)

(assert (=> b!104071 m!152095))

(declare-fun m!152097 () Bool)

(assert (=> b!104071 m!152097))

(declare-fun m!152099 () Bool)

(assert (=> b!104071 m!152099))

(declare-fun m!152101 () Bool)

(assert (=> b!104071 m!152101))

(declare-fun m!152103 () Bool)

(assert (=> b!104071 m!152103))

(declare-fun m!152105 () Bool)

(assert (=> b!104071 m!152105))

(declare-fun m!152107 () Bool)

(assert (=> b!104071 m!152107))

(declare-fun m!152109 () Bool)

(assert (=> b!104071 m!152109))

(declare-fun m!152111 () Bool)

(assert (=> b!104071 m!152111))

(push 1)

(assert (not b!104068))

(assert (not b!104075))

(assert (not b!104070))

(assert (not start!20600))

(assert (not b!104071))

(assert (not b!104073))

(assert (not b!104074))

(assert (not b!104076))

(assert (not b!104065))

(assert (not b!104078))

(assert (not b!104069))

(assert (not b!104066))

(assert (not b!104077))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

