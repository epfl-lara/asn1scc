; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14068 () Bool)

(assert start!14068)

(declare-fun res!59550 () Bool)

(declare-fun e!47033 () Bool)

(assert (=> start!14068 (=> (not res!59550) (not e!47033))))

(declare-datatypes ((array!2951 0))(
  ( (array!2952 (arr!1969 (Array (_ BitVec 32) (_ BitVec 8))) (size!1378 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2951)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> start!14068 (= res!59550 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1378 srcBuffer!2))))))))

(assert (=> start!14068 e!47033))

(assert (=> start!14068 true))

(declare-fun array_inv!1227 (array!2951) Bool)

(assert (=> start!14068 (array_inv!1227 srcBuffer!2)))

(declare-datatypes ((BitStream!2336 0))(
  ( (BitStream!2337 (buf!1759 array!2951) (currentByte!3485 (_ BitVec 32)) (currentBit!3480 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2336)

(declare-fun e!47046 () Bool)

(declare-fun inv!12 (BitStream!2336) Bool)

(assert (=> start!14068 (and (inv!12 thiss!1379) e!47046)))

(declare-fun b!72203 () Bool)

(declare-fun res!59559 () Bool)

(declare-fun e!47040 () Bool)

(assert (=> b!72203 (=> res!59559 e!47040)))

(declare-datatypes ((List!743 0))(
  ( (Nil!740) (Cons!739 (h!858 Bool) (t!1493 List!743)) )
))
(declare-fun lt!116630 () List!743)

(declare-fun length!371 (List!743) Int)

(assert (=> b!72203 (= res!59559 (<= (length!371 lt!116630) 0))))

(declare-fun b!72204 () Bool)

(declare-fun e!47043 () Bool)

(declare-fun e!47044 () Bool)

(assert (=> b!72204 (= e!47043 e!47044)))

(declare-fun res!59555 () Bool)

(assert (=> b!72204 (=> res!59555 e!47044)))

(declare-fun lt!116619 () Bool)

(declare-fun lt!116636 () Bool)

(assert (=> b!72204 (= res!59555 (not (= lt!116619 lt!116636)))))

(declare-fun lt!116617 () Bool)

(assert (=> b!72204 (= lt!116617 lt!116619)))

(declare-datatypes ((Unit!4809 0))(
  ( (Unit!4810) )
))
(declare-datatypes ((tuple2!6240 0))(
  ( (tuple2!6241 (_1!3234 Unit!4809) (_2!3234 BitStream!2336)) )
))
(declare-fun lt!116629 () tuple2!6240)

(declare-fun lt!116634 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2951 (_ BitVec 64)) Bool)

(assert (=> b!72204 (= lt!116619 (bitAt!0 (buf!1759 (_2!3234 lt!116629)) lt!116634))))

(declare-fun lt!116637 () tuple2!6240)

(declare-fun lt!116618 () (_ BitVec 64))

(declare-fun lt!116614 () Unit!4809)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2951 array!2951 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4809)

(assert (=> b!72204 (= lt!116614 (arrayBitRangesEqImpliesEq!0 (buf!1759 (_2!3234 lt!116637)) (buf!1759 (_2!3234 lt!116629)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!116634 lt!116618))))

(declare-fun b!72205 () Bool)

(declare-fun res!59551 () Bool)

(declare-fun e!47035 () Bool)

(assert (=> b!72205 (=> res!59551 e!47035)))

(assert (=> b!72205 (= res!59551 (not (= (size!1378 (buf!1759 thiss!1379)) (size!1378 (buf!1759 (_2!3234 lt!116629))))))))

(declare-fun b!72206 () Bool)

(declare-fun res!59560 () Bool)

(assert (=> b!72206 (=> res!59560 e!47035)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!72206 (= res!59560 (not (invariant!0 (currentBit!3480 (_2!3234 lt!116629)) (currentByte!3485 (_2!3234 lt!116629)) (size!1378 (buf!1759 (_2!3234 lt!116629))))))))

(declare-fun b!72207 () Bool)

(declare-fun e!47036 () Bool)

(assert (=> b!72207 (= e!47036 e!47035)))

(declare-fun res!59558 () Bool)

(assert (=> b!72207 (=> res!59558 e!47035)))

(declare-fun lt!116624 () (_ BitVec 64))

(assert (=> b!72207 (= res!59558 (not (= lt!116624 (bvsub (bvadd lt!116634 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!72207 (= lt!116624 (bitIndex!0 (size!1378 (buf!1759 (_2!3234 lt!116629))) (currentByte!3485 (_2!3234 lt!116629)) (currentBit!3480 (_2!3234 lt!116629))))))

(declare-fun b!72208 () Bool)

(declare-datatypes ((tuple2!6242 0))(
  ( (tuple2!6243 (_1!3235 BitStream!2336) (_2!3235 BitStream!2336)) )
))
(declare-fun lt!116638 () tuple2!6242)

(declare-fun e!47037 () Bool)

(declare-fun head!562 (List!743) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2336 array!2951 (_ BitVec 64) (_ BitVec 64)) List!743)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2336 BitStream!2336 (_ BitVec 64)) List!743)

(assert (=> b!72208 (= e!47037 (= (head!562 (byteArrayBitContentToList!0 (_2!3234 lt!116637) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!562 (bitStreamReadBitsIntoList!0 (_2!3234 lt!116637) (_1!3235 lt!116638) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!72209 () Bool)

(assert (=> b!72209 (= e!47046 (array_inv!1227 (buf!1759 thiss!1379)))))

(declare-fun b!72210 () Bool)

(declare-fun e!47041 () Bool)

(declare-fun e!47048 () Bool)

(assert (=> b!72210 (= e!47041 e!47048)))

(declare-fun res!59562 () Bool)

(assert (=> b!72210 (=> res!59562 e!47048)))

(declare-fun isPrefixOf!0 (BitStream!2336 BitStream!2336) Bool)

(assert (=> b!72210 (= res!59562 (not (isPrefixOf!0 thiss!1379 (_2!3234 lt!116637))))))

(declare-fun lt!116631 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!72210 (validate_offset_bits!1 ((_ sign_extend 32) (size!1378 (buf!1759 (_2!3234 lt!116637)))) ((_ sign_extend 32) (currentByte!3485 (_2!3234 lt!116637))) ((_ sign_extend 32) (currentBit!3480 (_2!3234 lt!116637))) lt!116631)))

(assert (=> b!72210 (= lt!116631 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116633 () Unit!4809)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2336 BitStream!2336 (_ BitVec 64) (_ BitVec 64)) Unit!4809)

(assert (=> b!72210 (= lt!116633 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3234 lt!116637) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2336 (_ BitVec 8) (_ BitVec 32)) tuple2!6240)

(assert (=> b!72210 (= lt!116637 (appendBitFromByte!0 thiss!1379 (select (arr!1969 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!72211 () Bool)

(declare-fun res!59557 () Bool)

(declare-fun e!47034 () Bool)

(assert (=> b!72211 (=> res!59557 e!47034)))

(declare-fun lt!116615 () Bool)

(assert (=> b!72211 (= res!59557 (not (= (head!562 lt!116630) lt!116615)))))

(declare-fun b!72212 () Bool)

(declare-fun e!47038 () Bool)

(assert (=> b!72212 (= e!47038 e!47043)))

(declare-fun res!59567 () Bool)

(assert (=> b!72212 (=> res!59567 e!47043)))

(assert (=> b!72212 (= res!59567 (not (= lt!116617 lt!116636)))))

(assert (=> b!72212 (= lt!116617 (bitAt!0 (buf!1759 (_2!3234 lt!116637)) lt!116634))))

(declare-fun b!72213 () Bool)

(declare-fun e!47045 () Bool)

(assert (=> b!72213 (= e!47045 e!47034)))

(declare-fun res!59556 () Bool)

(assert (=> b!72213 (=> res!59556 e!47034)))

(declare-fun lt!116632 () tuple2!6242)

(assert (=> b!72213 (= res!59556 (not (= lt!116615 (bitAt!0 (buf!1759 (_1!3235 lt!116632)) lt!116634))))))

(declare-fun lt!116621 () tuple2!6242)

(assert (=> b!72213 (= lt!116615 (bitAt!0 (buf!1759 (_1!3235 lt!116621)) lt!116634))))

(declare-fun b!72214 () Bool)

(declare-fun res!59563 () Bool)

(declare-fun e!47042 () Bool)

(assert (=> b!72214 (=> res!59563 e!47042)))

(assert (=> b!72214 (= res!59563 (not (invariant!0 (currentBit!3480 (_2!3234 lt!116637)) (currentByte!3485 (_2!3234 lt!116637)) (size!1378 (buf!1759 (_2!3234 lt!116629))))))))

(declare-fun b!72215 () Bool)

(assert (=> b!72215 (= e!47040 e!47045)))

(declare-fun res!59561 () Bool)

(assert (=> b!72215 (=> res!59561 e!47045)))

(declare-fun lt!116626 () List!743)

(declare-fun lt!116616 () List!743)

(assert (=> b!72215 (= res!59561 (not (= lt!116626 lt!116616)))))

(assert (=> b!72215 (= lt!116616 lt!116626)))

(declare-fun tail!347 (List!743) List!743)

(assert (=> b!72215 (= lt!116626 (tail!347 lt!116630))))

(declare-fun lt!116625 () Unit!4809)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2336 BitStream!2336 BitStream!2336 BitStream!2336 (_ BitVec 64) List!743) Unit!4809)

(assert (=> b!72215 (= lt!116625 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3234 lt!116629) (_2!3234 lt!116629) (_1!3235 lt!116621) (_1!3235 lt!116632) (bvsub to!314 i!635) lt!116630))))

(declare-fun b!72216 () Bool)

(assert (=> b!72216 (= e!47044 true)))

(declare-datatypes ((tuple2!6244 0))(
  ( (tuple2!6245 (_1!3236 BitStream!2336) (_2!3236 Bool)) )
))
(declare-fun lt!116628 () tuple2!6244)

(declare-fun readBitPure!0 (BitStream!2336) tuple2!6244)

(assert (=> b!72216 (= lt!116628 (readBitPure!0 (_1!3235 lt!116621)))))

(declare-fun b!72217 () Bool)

(assert (=> b!72217 (= e!47034 e!47038)))

(declare-fun res!59552 () Bool)

(assert (=> b!72217 (=> res!59552 e!47038)))

(assert (=> b!72217 (= res!59552 (not (= (head!562 (byteArrayBitContentToList!0 (_2!3234 lt!116629) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!116636)))))

(assert (=> b!72217 (= lt!116636 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!72218 () Bool)

(declare-fun res!59553 () Bool)

(assert (=> b!72218 (=> (not res!59553) (not e!47033))))

(assert (=> b!72218 (= res!59553 (validate_offset_bits!1 ((_ sign_extend 32) (size!1378 (buf!1759 thiss!1379))) ((_ sign_extend 32) (currentByte!3485 thiss!1379)) ((_ sign_extend 32) (currentBit!3480 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!72219 () Bool)

(assert (=> b!72219 (= e!47035 e!47042)))

(declare-fun res!59565 () Bool)

(assert (=> b!72219 (=> res!59565 e!47042)))

(assert (=> b!72219 (= res!59565 (not (= (size!1378 (buf!1759 (_2!3234 lt!116637))) (size!1378 (buf!1759 (_2!3234 lt!116629))))))))

(assert (=> b!72219 (= lt!116624 (bvsub (bvsub (bvadd lt!116618 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!72219 (= lt!116618 (bitIndex!0 (size!1378 (buf!1759 (_2!3234 lt!116637))) (currentByte!3485 (_2!3234 lt!116637)) (currentBit!3480 (_2!3234 lt!116637))))))

(assert (=> b!72219 (= (size!1378 (buf!1759 (_2!3234 lt!116629))) (size!1378 (buf!1759 thiss!1379)))))

(declare-fun b!72220 () Bool)

(assert (=> b!72220 (= e!47033 (not e!47041))))

(declare-fun res!59566 () Bool)

(assert (=> b!72220 (=> res!59566 e!47041)))

(assert (=> b!72220 (= res!59566 (bvsge i!635 to!314))))

(assert (=> b!72220 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!116623 () Unit!4809)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2336) Unit!4809)

(assert (=> b!72220 (= lt!116623 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!72220 (= lt!116634 (bitIndex!0 (size!1378 (buf!1759 thiss!1379)) (currentByte!3485 thiss!1379) (currentBit!3480 thiss!1379)))))

(declare-fun b!72221 () Bool)

(assert (=> b!72221 (= e!47048 e!47036)))

(declare-fun res!59568 () Bool)

(assert (=> b!72221 (=> res!59568 e!47036)))

(assert (=> b!72221 (= res!59568 (not (isPrefixOf!0 (_2!3234 lt!116637) (_2!3234 lt!116629))))))

(assert (=> b!72221 (isPrefixOf!0 thiss!1379 (_2!3234 lt!116629))))

(declare-fun lt!116622 () Unit!4809)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2336 BitStream!2336 BitStream!2336) Unit!4809)

(assert (=> b!72221 (= lt!116622 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3234 lt!116637) (_2!3234 lt!116629)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2336 array!2951 (_ BitVec 64) (_ BitVec 64)) tuple2!6240)

(assert (=> b!72221 (= lt!116629 (appendBitsMSBFirstLoop!0 (_2!3234 lt!116637) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!72221 e!47037))

(declare-fun res!59564 () Bool)

(assert (=> b!72221 (=> (not res!59564) (not e!47037))))

(assert (=> b!72221 (= res!59564 (validate_offset_bits!1 ((_ sign_extend 32) (size!1378 (buf!1759 (_2!3234 lt!116637)))) ((_ sign_extend 32) (currentByte!3485 thiss!1379)) ((_ sign_extend 32) (currentBit!3480 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!116620 () Unit!4809)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2336 array!2951 (_ BitVec 64)) Unit!4809)

(assert (=> b!72221 (= lt!116620 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1759 (_2!3234 lt!116637)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2336 BitStream!2336) tuple2!6242)

(assert (=> b!72221 (= lt!116638 (reader!0 thiss!1379 (_2!3234 lt!116637)))))

(declare-fun b!72222 () Bool)

(declare-fun res!59549 () Bool)

(assert (=> b!72222 (=> res!59549 e!47042)))

(assert (=> b!72222 (= res!59549 (not (invariant!0 (currentBit!3480 (_2!3234 lt!116637)) (currentByte!3485 (_2!3234 lt!116637)) (size!1378 (buf!1759 (_2!3234 lt!116637))))))))

(declare-fun b!72223 () Bool)

(assert (=> b!72223 (= e!47042 e!47040)))

(declare-fun res!59554 () Bool)

(assert (=> b!72223 (=> res!59554 e!47040)))

(assert (=> b!72223 (= res!59554 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!72223 (= lt!116616 (bitStreamReadBitsIntoList!0 (_2!3234 lt!116629) (_1!3235 lt!116632) lt!116631))))

(assert (=> b!72223 (= lt!116630 (bitStreamReadBitsIntoList!0 (_2!3234 lt!116629) (_1!3235 lt!116621) (bvsub to!314 i!635)))))

(assert (=> b!72223 (validate_offset_bits!1 ((_ sign_extend 32) (size!1378 (buf!1759 (_2!3234 lt!116629)))) ((_ sign_extend 32) (currentByte!3485 (_2!3234 lt!116637))) ((_ sign_extend 32) (currentBit!3480 (_2!3234 lt!116637))) lt!116631)))

(declare-fun lt!116635 () Unit!4809)

(assert (=> b!72223 (= lt!116635 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3234 lt!116637) (buf!1759 (_2!3234 lt!116629)) lt!116631))))

(assert (=> b!72223 (= lt!116632 (reader!0 (_2!3234 lt!116637) (_2!3234 lt!116629)))))

(assert (=> b!72223 (validate_offset_bits!1 ((_ sign_extend 32) (size!1378 (buf!1759 (_2!3234 lt!116629)))) ((_ sign_extend 32) (currentByte!3485 thiss!1379)) ((_ sign_extend 32) (currentBit!3480 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!116627 () Unit!4809)

(assert (=> b!72223 (= lt!116627 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1759 (_2!3234 lt!116629)) (bvsub to!314 i!635)))))

(assert (=> b!72223 (= lt!116621 (reader!0 thiss!1379 (_2!3234 lt!116629)))))

(assert (= (and start!14068 res!59550) b!72218))

(assert (= (and b!72218 res!59553) b!72220))

(assert (= (and b!72220 (not res!59566)) b!72210))

(assert (= (and b!72210 (not res!59562)) b!72221))

(assert (= (and b!72221 res!59564) b!72208))

(assert (= (and b!72221 (not res!59568)) b!72207))

(assert (= (and b!72207 (not res!59558)) b!72206))

(assert (= (and b!72206 (not res!59560)) b!72205))

(assert (= (and b!72205 (not res!59551)) b!72219))

(assert (= (and b!72219 (not res!59565)) b!72222))

(assert (= (and b!72222 (not res!59549)) b!72214))

(assert (= (and b!72214 (not res!59563)) b!72223))

(assert (= (and b!72223 (not res!59554)) b!72203))

(assert (= (and b!72203 (not res!59559)) b!72215))

(assert (= (and b!72215 (not res!59561)) b!72213))

(assert (= (and b!72213 (not res!59556)) b!72211))

(assert (= (and b!72211 (not res!59557)) b!72217))

(assert (= (and b!72217 (not res!59552)) b!72212))

(assert (= (and b!72212 (not res!59567)) b!72204))

(assert (= (and b!72204 (not res!59555)) b!72216))

(assert (= start!14068 b!72209))

(declare-fun m!115871 () Bool)

(assert (=> b!72204 m!115871))

(declare-fun m!115873 () Bool)

(assert (=> b!72204 m!115873))

(declare-fun m!115875 () Bool)

(assert (=> b!72222 m!115875))

(declare-fun m!115877 () Bool)

(assert (=> b!72210 m!115877))

(declare-fun m!115879 () Bool)

(assert (=> b!72210 m!115879))

(declare-fun m!115881 () Bool)

(assert (=> b!72210 m!115881))

(declare-fun m!115883 () Bool)

(assert (=> b!72210 m!115883))

(assert (=> b!72210 m!115879))

(declare-fun m!115885 () Bool)

(assert (=> b!72210 m!115885))

(declare-fun m!115887 () Bool)

(assert (=> b!72219 m!115887))

(declare-fun m!115889 () Bool)

(assert (=> b!72215 m!115889))

(declare-fun m!115891 () Bool)

(assert (=> b!72215 m!115891))

(declare-fun m!115893 () Bool)

(assert (=> b!72217 m!115893))

(assert (=> b!72217 m!115893))

(declare-fun m!115895 () Bool)

(assert (=> b!72217 m!115895))

(declare-fun m!115897 () Bool)

(assert (=> b!72217 m!115897))

(declare-fun m!115899 () Bool)

(assert (=> b!72221 m!115899))

(declare-fun m!115901 () Bool)

(assert (=> b!72221 m!115901))

(declare-fun m!115903 () Bool)

(assert (=> b!72221 m!115903))

(declare-fun m!115905 () Bool)

(assert (=> b!72221 m!115905))

(declare-fun m!115907 () Bool)

(assert (=> b!72221 m!115907))

(declare-fun m!115909 () Bool)

(assert (=> b!72221 m!115909))

(declare-fun m!115911 () Bool)

(assert (=> b!72221 m!115911))

(declare-fun m!115913 () Bool)

(assert (=> b!72212 m!115913))

(declare-fun m!115915 () Bool)

(assert (=> b!72223 m!115915))

(declare-fun m!115917 () Bool)

(assert (=> b!72223 m!115917))

(declare-fun m!115919 () Bool)

(assert (=> b!72223 m!115919))

(declare-fun m!115921 () Bool)

(assert (=> b!72223 m!115921))

(declare-fun m!115923 () Bool)

(assert (=> b!72223 m!115923))

(declare-fun m!115925 () Bool)

(assert (=> b!72223 m!115925))

(declare-fun m!115927 () Bool)

(assert (=> b!72223 m!115927))

(declare-fun m!115929 () Bool)

(assert (=> b!72223 m!115929))

(declare-fun m!115931 () Bool)

(assert (=> b!72213 m!115931))

(declare-fun m!115933 () Bool)

(assert (=> b!72213 m!115933))

(declare-fun m!115935 () Bool)

(assert (=> b!72203 m!115935))

(declare-fun m!115937 () Bool)

(assert (=> b!72216 m!115937))

(declare-fun m!115939 () Bool)

(assert (=> b!72209 m!115939))

(declare-fun m!115941 () Bool)

(assert (=> b!72211 m!115941))

(declare-fun m!115943 () Bool)

(assert (=> start!14068 m!115943))

(declare-fun m!115945 () Bool)

(assert (=> start!14068 m!115945))

(declare-fun m!115947 () Bool)

(assert (=> b!72208 m!115947))

(assert (=> b!72208 m!115947))

(declare-fun m!115949 () Bool)

(assert (=> b!72208 m!115949))

(declare-fun m!115951 () Bool)

(assert (=> b!72208 m!115951))

(assert (=> b!72208 m!115951))

(declare-fun m!115953 () Bool)

(assert (=> b!72208 m!115953))

(declare-fun m!115955 () Bool)

(assert (=> b!72220 m!115955))

(declare-fun m!115957 () Bool)

(assert (=> b!72220 m!115957))

(declare-fun m!115959 () Bool)

(assert (=> b!72220 m!115959))

(declare-fun m!115961 () Bool)

(assert (=> b!72207 m!115961))

(declare-fun m!115963 () Bool)

(assert (=> b!72214 m!115963))

(declare-fun m!115965 () Bool)

(assert (=> b!72218 m!115965))

(declare-fun m!115967 () Bool)

(assert (=> b!72206 m!115967))

(push 1)

(assert (not b!72207))

(assert (not b!72209))

(assert (not start!14068))

(assert (not b!72213))

(assert (not b!72217))

(assert (not b!72208))

(assert (not b!72218))

(assert (not b!72223))

(assert (not b!72210))

(assert (not b!72211))

(assert (not b!72215))

(assert (not b!72203))

(assert (not b!72214))

(assert (not b!72212))

(assert (not b!72220))

(assert (not b!72204))

(assert (not b!72216))

(assert (not b!72221))

(assert (not b!72206))

(assert (not b!72222))

(assert (not b!72219))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

