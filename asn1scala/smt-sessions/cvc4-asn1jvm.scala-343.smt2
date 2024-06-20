; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8094 () Bool)

(assert start!8094)

(declare-fun b!40773 () Bool)

(declare-fun e!26886 () Bool)

(declare-datatypes ((array!2016 0))(
  ( (array!2017 (arr!1411 (Array (_ BitVec 32) (_ BitVec 8))) (size!912 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1568 0))(
  ( (BitStream!1569 (buf!1240 array!2016) (currentByte!2658 (_ BitVec 32)) (currentBit!2653 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1568)

(declare-fun array_inv!837 (array!2016) Bool)

(assert (=> b!40773 (= e!26886 (array_inv!837 (buf!1240 thiss!1379)))))

(declare-fun b!40774 () Bool)

(declare-fun e!26884 () Bool)

(declare-fun e!26881 () Bool)

(assert (=> b!40774 (= e!26884 e!26881)))

(declare-fun res!34701 () Bool)

(assert (=> b!40774 (=> res!34701 e!26881)))

(declare-datatypes ((Unit!2869 0))(
  ( (Unit!2870) )
))
(declare-datatypes ((tuple2!3916 0))(
  ( (tuple2!3917 (_1!2045 Unit!2869) (_2!2045 BitStream!1568)) )
))
(declare-fun lt!61976 () tuple2!3916)

(declare-fun lt!61974 () tuple2!3916)

(assert (=> b!40774 (= res!34701 (not (= (size!912 (buf!1240 (_2!2045 lt!61976))) (size!912 (buf!1240 (_2!2045 lt!61974))))))))

(declare-fun lt!61978 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!61985 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!40774 (= lt!61985 (bvsub (bvsub (bvadd lt!61978 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40774 (= lt!61978 (bitIndex!0 (size!912 (buf!1240 (_2!2045 lt!61976))) (currentByte!2658 (_2!2045 lt!61976)) (currentBit!2653 (_2!2045 lt!61976))))))

(assert (=> b!40774 (= (size!912 (buf!1240 (_2!2045 lt!61974))) (size!912 (buf!1240 thiss!1379)))))

(declare-fun b!40775 () Bool)

(declare-fun res!34703 () Bool)

(declare-fun e!26882 () Bool)

(assert (=> b!40775 (=> res!34703 e!26882)))

(declare-datatypes ((List!485 0))(
  ( (Nil!482) (Cons!481 (h!600 Bool) (t!1235 List!485)) )
))
(declare-fun lt!61970 () List!485)

(declare-fun length!211 (List!485) Int)

(assert (=> b!40775 (= res!34703 (<= (length!211 lt!61970) 0))))

(declare-fun b!40776 () Bool)

(declare-fun e!26883 () Bool)

(assert (=> b!40776 (= e!26882 e!26883)))

(declare-fun res!34706 () Bool)

(assert (=> b!40776 (=> res!34706 e!26883)))

(declare-fun lt!61971 () List!485)

(declare-fun lt!61964 () List!485)

(assert (=> b!40776 (= res!34706 (not (= lt!61971 lt!61964)))))

(assert (=> b!40776 (= lt!61964 lt!61971)))

(declare-fun tail!202 (List!485) List!485)

(assert (=> b!40776 (= lt!61971 (tail!202 lt!61970))))

(declare-datatypes ((tuple2!3918 0))(
  ( (tuple2!3919 (_1!2046 BitStream!1568) (_2!2046 BitStream!1568)) )
))
(declare-fun lt!61987 () tuple2!3918)

(declare-fun lt!61981 () tuple2!3918)

(declare-fun lt!61983 () Unit!2869)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1568 BitStream!1568 BitStream!1568 BitStream!1568 (_ BitVec 64) List!485) Unit!2869)

(assert (=> b!40776 (= lt!61983 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2045 lt!61974) (_2!2045 lt!61974) (_1!2046 lt!61987) (_1!2046 lt!61981) (bvsub to!314 i!635) lt!61970))))

(declare-fun b!40777 () Bool)

(declare-fun e!26889 () Bool)

(assert (=> b!40777 (= e!26889 true)))

(declare-datatypes ((tuple2!3920 0))(
  ( (tuple2!3921 (_1!2047 BitStream!1568) (_2!2047 Bool)) )
))
(declare-fun lt!61979 () tuple2!3920)

(declare-fun readBitPure!0 (BitStream!1568) tuple2!3920)

(assert (=> b!40777 (= lt!61979 (readBitPure!0 (_1!2046 lt!61987)))))

(declare-fun b!40778 () Bool)

(declare-fun e!26893 () Bool)

(assert (=> b!40778 (= e!26893 e!26884)))

(declare-fun res!34705 () Bool)

(assert (=> b!40778 (=> res!34705 e!26884)))

(declare-fun lt!61963 () (_ BitVec 64))

(assert (=> b!40778 (= res!34705 (not (= lt!61985 (bvsub (bvadd lt!61963 to!314) i!635))))))

(assert (=> b!40778 (= lt!61985 (bitIndex!0 (size!912 (buf!1240 (_2!2045 lt!61974))) (currentByte!2658 (_2!2045 lt!61974)) (currentBit!2653 (_2!2045 lt!61974))))))

(declare-fun b!40779 () Bool)

(declare-fun res!34716 () Bool)

(assert (=> b!40779 (=> res!34716 e!26884)))

(assert (=> b!40779 (= res!34716 (not (= (size!912 (buf!1240 thiss!1379)) (size!912 (buf!1240 (_2!2045 lt!61974))))))))

(declare-fun b!40772 () Bool)

(declare-fun e!26895 () Bool)

(assert (=> b!40772 (= e!26895 e!26893)))

(declare-fun res!34711 () Bool)

(assert (=> b!40772 (=> res!34711 e!26893)))

(declare-fun isPrefixOf!0 (BitStream!1568 BitStream!1568) Bool)

(assert (=> b!40772 (= res!34711 (not (isPrefixOf!0 (_2!2045 lt!61976) (_2!2045 lt!61974))))))

(assert (=> b!40772 (isPrefixOf!0 thiss!1379 (_2!2045 lt!61974))))

(declare-fun lt!61973 () Unit!2869)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1568 BitStream!1568 BitStream!1568) Unit!2869)

(assert (=> b!40772 (= lt!61973 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2045 lt!61976) (_2!2045 lt!61974)))))

(declare-fun srcBuffer!2 () array!2016)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1568 array!2016 (_ BitVec 64) (_ BitVec 64)) tuple2!3916)

(assert (=> b!40772 (= lt!61974 (appendBitsMSBFirstLoop!0 (_2!2045 lt!61976) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!26890 () Bool)

(assert (=> b!40772 e!26890))

(declare-fun res!34715 () Bool)

(assert (=> b!40772 (=> (not res!34715) (not e!26890))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40772 (= res!34715 (validate_offset_bits!1 ((_ sign_extend 32) (size!912 (buf!1240 (_2!2045 lt!61976)))) ((_ sign_extend 32) (currentByte!2658 thiss!1379)) ((_ sign_extend 32) (currentBit!2653 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61986 () Unit!2869)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1568 array!2016 (_ BitVec 64)) Unit!2869)

(assert (=> b!40772 (= lt!61986 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1240 (_2!2045 lt!61976)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61982 () tuple2!3918)

(declare-fun reader!0 (BitStream!1568 BitStream!1568) tuple2!3918)

(assert (=> b!40772 (= lt!61982 (reader!0 thiss!1379 (_2!2045 lt!61976)))))

(declare-fun res!34702 () Bool)

(declare-fun e!26888 () Bool)

(assert (=> start!8094 (=> (not res!34702) (not e!26888))))

(assert (=> start!8094 (= res!34702 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!912 srcBuffer!2))))))))

(assert (=> start!8094 e!26888))

(assert (=> start!8094 true))

(assert (=> start!8094 (array_inv!837 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1568) Bool)

(assert (=> start!8094 (and (inv!12 thiss!1379) e!26886)))

(declare-fun b!40780 () Bool)

(declare-fun e!26885 () Bool)

(declare-fun e!26896 () Bool)

(assert (=> b!40780 (= e!26885 e!26896)))

(declare-fun res!34708 () Bool)

(assert (=> b!40780 (=> res!34708 e!26896)))

(declare-fun lt!61984 () Bool)

(declare-fun head!322 (List!485) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1568 array!2016 (_ BitVec 64) (_ BitVec 64)) List!485)

(assert (=> b!40780 (= res!34708 (not (= (head!322 (byteArrayBitContentToList!0 (_2!2045 lt!61974) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!61984)))))

(declare-fun bitAt!0 (array!2016 (_ BitVec 64)) Bool)

(assert (=> b!40780 (= lt!61984 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!40781 () Bool)

(declare-fun e!26894 () Bool)

(assert (=> b!40781 (= e!26894 e!26889)))

(declare-fun res!34718 () Bool)

(assert (=> b!40781 (=> res!34718 e!26889)))

(declare-fun lt!61969 () Bool)

(assert (=> b!40781 (= res!34718 (not (= lt!61969 lt!61984)))))

(declare-fun lt!61977 () Bool)

(assert (=> b!40781 (= lt!61977 lt!61969)))

(assert (=> b!40781 (= lt!61969 (bitAt!0 (buf!1240 (_2!2045 lt!61974)) lt!61963))))

(declare-fun lt!61967 () Unit!2869)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2016 array!2016 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2869)

(assert (=> b!40781 (= lt!61967 (arrayBitRangesEqImpliesEq!0 (buf!1240 (_2!2045 lt!61976)) (buf!1240 (_2!2045 lt!61974)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!61963 lt!61978))))

(declare-fun b!40782 () Bool)

(declare-fun res!34710 () Bool)

(assert (=> b!40782 (=> res!34710 e!26884)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40782 (= res!34710 (not (invariant!0 (currentBit!2653 (_2!2045 lt!61974)) (currentByte!2658 (_2!2045 lt!61974)) (size!912 (buf!1240 (_2!2045 lt!61974))))))))

(declare-fun b!40783 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1568 BitStream!1568 (_ BitVec 64)) List!485)

(assert (=> b!40783 (= e!26890 (= (head!322 (byteArrayBitContentToList!0 (_2!2045 lt!61976) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!322 (bitStreamReadBitsIntoList!0 (_2!2045 lt!61976) (_1!2046 lt!61982) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!40784 () Bool)

(declare-fun e!26892 () Bool)

(assert (=> b!40784 (= e!26888 (not e!26892))))

(declare-fun res!34719 () Bool)

(assert (=> b!40784 (=> res!34719 e!26892)))

(assert (=> b!40784 (= res!34719 (bvsge i!635 to!314))))

(assert (=> b!40784 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!61966 () Unit!2869)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1568) Unit!2869)

(assert (=> b!40784 (= lt!61966 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!40784 (= lt!61963 (bitIndex!0 (size!912 (buf!1240 thiss!1379)) (currentByte!2658 thiss!1379) (currentBit!2653 thiss!1379)))))

(declare-fun b!40785 () Bool)

(assert (=> b!40785 (= e!26881 e!26882)))

(declare-fun res!34717 () Bool)

(assert (=> b!40785 (=> res!34717 e!26882)))

(assert (=> b!40785 (= res!34717 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!61980 () (_ BitVec 64))

(assert (=> b!40785 (= lt!61964 (bitStreamReadBitsIntoList!0 (_2!2045 lt!61974) (_1!2046 lt!61981) lt!61980))))

(assert (=> b!40785 (= lt!61970 (bitStreamReadBitsIntoList!0 (_2!2045 lt!61974) (_1!2046 lt!61987) (bvsub to!314 i!635)))))

(assert (=> b!40785 (validate_offset_bits!1 ((_ sign_extend 32) (size!912 (buf!1240 (_2!2045 lt!61974)))) ((_ sign_extend 32) (currentByte!2658 (_2!2045 lt!61976))) ((_ sign_extend 32) (currentBit!2653 (_2!2045 lt!61976))) lt!61980)))

(declare-fun lt!61975 () Unit!2869)

(assert (=> b!40785 (= lt!61975 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2045 lt!61976) (buf!1240 (_2!2045 lt!61974)) lt!61980))))

(assert (=> b!40785 (= lt!61981 (reader!0 (_2!2045 lt!61976) (_2!2045 lt!61974)))))

(assert (=> b!40785 (validate_offset_bits!1 ((_ sign_extend 32) (size!912 (buf!1240 (_2!2045 lt!61974)))) ((_ sign_extend 32) (currentByte!2658 thiss!1379)) ((_ sign_extend 32) (currentBit!2653 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!61968 () Unit!2869)

(assert (=> b!40785 (= lt!61968 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1240 (_2!2045 lt!61974)) (bvsub to!314 i!635)))))

(assert (=> b!40785 (= lt!61987 (reader!0 thiss!1379 (_2!2045 lt!61974)))))

(declare-fun b!40786 () Bool)

(declare-fun res!34709 () Bool)

(assert (=> b!40786 (=> (not res!34709) (not e!26888))))

(assert (=> b!40786 (= res!34709 (validate_offset_bits!1 ((_ sign_extend 32) (size!912 (buf!1240 thiss!1379))) ((_ sign_extend 32) (currentByte!2658 thiss!1379)) ((_ sign_extend 32) (currentBit!2653 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40787 () Bool)

(assert (=> b!40787 (= e!26896 e!26894)))

(declare-fun res!34700 () Bool)

(assert (=> b!40787 (=> res!34700 e!26894)))

(assert (=> b!40787 (= res!34700 (not (= lt!61977 lt!61984)))))

(assert (=> b!40787 (= lt!61977 (bitAt!0 (buf!1240 (_2!2045 lt!61976)) lt!61963))))

(declare-fun b!40788 () Bool)

(declare-fun res!34712 () Bool)

(assert (=> b!40788 (=> res!34712 e!26885)))

(declare-fun lt!61972 () Bool)

(assert (=> b!40788 (= res!34712 (not (= (head!322 lt!61970) lt!61972)))))

(declare-fun b!40789 () Bool)

(declare-fun res!34713 () Bool)

(assert (=> b!40789 (=> res!34713 e!26881)))

(assert (=> b!40789 (= res!34713 (not (invariant!0 (currentBit!2653 (_2!2045 lt!61976)) (currentByte!2658 (_2!2045 lt!61976)) (size!912 (buf!1240 (_2!2045 lt!61974))))))))

(declare-fun b!40790 () Bool)

(assert (=> b!40790 (= e!26883 e!26885)))

(declare-fun res!34707 () Bool)

(assert (=> b!40790 (=> res!34707 e!26885)))

(assert (=> b!40790 (= res!34707 (not (= lt!61972 (bitAt!0 (buf!1240 (_1!2046 lt!61981)) lt!61963))))))

(assert (=> b!40790 (= lt!61972 (bitAt!0 (buf!1240 (_1!2046 lt!61987)) lt!61963))))

(declare-fun b!40791 () Bool)

(declare-fun res!34714 () Bool)

(assert (=> b!40791 (=> res!34714 e!26881)))

(assert (=> b!40791 (= res!34714 (not (invariant!0 (currentBit!2653 (_2!2045 lt!61976)) (currentByte!2658 (_2!2045 lt!61976)) (size!912 (buf!1240 (_2!2045 lt!61976))))))))

(declare-fun b!40792 () Bool)

(assert (=> b!40792 (= e!26892 e!26895)))

(declare-fun res!34704 () Bool)

(assert (=> b!40792 (=> res!34704 e!26895)))

(assert (=> b!40792 (= res!34704 (not (isPrefixOf!0 thiss!1379 (_2!2045 lt!61976))))))

(assert (=> b!40792 (validate_offset_bits!1 ((_ sign_extend 32) (size!912 (buf!1240 (_2!2045 lt!61976)))) ((_ sign_extend 32) (currentByte!2658 (_2!2045 lt!61976))) ((_ sign_extend 32) (currentBit!2653 (_2!2045 lt!61976))) lt!61980)))

(assert (=> b!40792 (= lt!61980 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!61965 () Unit!2869)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1568 BitStream!1568 (_ BitVec 64) (_ BitVec 64)) Unit!2869)

(assert (=> b!40792 (= lt!61965 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2045 lt!61976) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1568 (_ BitVec 8) (_ BitVec 32)) tuple2!3916)

(assert (=> b!40792 (= lt!61976 (appendBitFromByte!0 thiss!1379 (select (arr!1411 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!8094 res!34702) b!40786))

(assert (= (and b!40786 res!34709) b!40784))

(assert (= (and b!40784 (not res!34719)) b!40792))

(assert (= (and b!40792 (not res!34704)) b!40772))

(assert (= (and b!40772 res!34715) b!40783))

(assert (= (and b!40772 (not res!34711)) b!40778))

(assert (= (and b!40778 (not res!34705)) b!40782))

(assert (= (and b!40782 (not res!34710)) b!40779))

(assert (= (and b!40779 (not res!34716)) b!40774))

(assert (= (and b!40774 (not res!34701)) b!40791))

(assert (= (and b!40791 (not res!34714)) b!40789))

(assert (= (and b!40789 (not res!34713)) b!40785))

(assert (= (and b!40785 (not res!34717)) b!40775))

(assert (= (and b!40775 (not res!34703)) b!40776))

(assert (= (and b!40776 (not res!34706)) b!40790))

(assert (= (and b!40790 (not res!34707)) b!40788))

(assert (= (and b!40788 (not res!34712)) b!40780))

(assert (= (and b!40780 (not res!34708)) b!40787))

(assert (= (and b!40787 (not res!34700)) b!40781))

(assert (= (and b!40781 (not res!34718)) b!40777))

(assert (= start!8094 b!40773))

(declare-fun m!62359 () Bool)

(assert (=> b!40772 m!62359))

(declare-fun m!62361 () Bool)

(assert (=> b!40772 m!62361))

(declare-fun m!62363 () Bool)

(assert (=> b!40772 m!62363))

(declare-fun m!62365 () Bool)

(assert (=> b!40772 m!62365))

(declare-fun m!62367 () Bool)

(assert (=> b!40772 m!62367))

(declare-fun m!62369 () Bool)

(assert (=> b!40772 m!62369))

(declare-fun m!62371 () Bool)

(assert (=> b!40772 m!62371))

(declare-fun m!62373 () Bool)

(assert (=> b!40776 m!62373))

(declare-fun m!62375 () Bool)

(assert (=> b!40776 m!62375))

(declare-fun m!62377 () Bool)

(assert (=> b!40775 m!62377))

(declare-fun m!62379 () Bool)

(assert (=> b!40778 m!62379))

(declare-fun m!62381 () Bool)

(assert (=> b!40791 m!62381))

(declare-fun m!62383 () Bool)

(assert (=> b!40780 m!62383))

(assert (=> b!40780 m!62383))

(declare-fun m!62385 () Bool)

(assert (=> b!40780 m!62385))

(declare-fun m!62387 () Bool)

(assert (=> b!40780 m!62387))

(declare-fun m!62389 () Bool)

(assert (=> b!40792 m!62389))

(declare-fun m!62391 () Bool)

(assert (=> b!40792 m!62391))

(declare-fun m!62393 () Bool)

(assert (=> b!40792 m!62393))

(declare-fun m!62395 () Bool)

(assert (=> b!40792 m!62395))

(assert (=> b!40792 m!62393))

(declare-fun m!62397 () Bool)

(assert (=> b!40792 m!62397))

(declare-fun m!62399 () Bool)

(assert (=> b!40773 m!62399))

(declare-fun m!62401 () Bool)

(assert (=> b!40777 m!62401))

(declare-fun m!62403 () Bool)

(assert (=> b!40781 m!62403))

(declare-fun m!62405 () Bool)

(assert (=> b!40781 m!62405))

(declare-fun m!62407 () Bool)

(assert (=> b!40789 m!62407))

(declare-fun m!62409 () Bool)

(assert (=> b!40785 m!62409))

(declare-fun m!62411 () Bool)

(assert (=> b!40785 m!62411))

(declare-fun m!62413 () Bool)

(assert (=> b!40785 m!62413))

(declare-fun m!62415 () Bool)

(assert (=> b!40785 m!62415))

(declare-fun m!62417 () Bool)

(assert (=> b!40785 m!62417))

(declare-fun m!62419 () Bool)

(assert (=> b!40785 m!62419))

(declare-fun m!62421 () Bool)

(assert (=> b!40785 m!62421))

(declare-fun m!62423 () Bool)

(assert (=> b!40785 m!62423))

(declare-fun m!62425 () Bool)

(assert (=> b!40774 m!62425))

(declare-fun m!62427 () Bool)

(assert (=> b!40788 m!62427))

(declare-fun m!62429 () Bool)

(assert (=> b!40783 m!62429))

(assert (=> b!40783 m!62429))

(declare-fun m!62431 () Bool)

(assert (=> b!40783 m!62431))

(declare-fun m!62433 () Bool)

(assert (=> b!40783 m!62433))

(assert (=> b!40783 m!62433))

(declare-fun m!62435 () Bool)

(assert (=> b!40783 m!62435))

(declare-fun m!62437 () Bool)

(assert (=> b!40787 m!62437))

(declare-fun m!62439 () Bool)

(assert (=> b!40782 m!62439))

(declare-fun m!62441 () Bool)

(assert (=> b!40786 m!62441))

(declare-fun m!62443 () Bool)

(assert (=> b!40784 m!62443))

(declare-fun m!62445 () Bool)

(assert (=> b!40784 m!62445))

(declare-fun m!62447 () Bool)

(assert (=> b!40784 m!62447))

(declare-fun m!62449 () Bool)

(assert (=> b!40790 m!62449))

(declare-fun m!62451 () Bool)

(assert (=> b!40790 m!62451))

(declare-fun m!62453 () Bool)

(assert (=> start!8094 m!62453))

(declare-fun m!62455 () Bool)

(assert (=> start!8094 m!62455))

(push 1)

(assert (not b!40785))

(assert (not b!40773))

(assert (not start!8094))

(assert (not b!40791))

(assert (not b!40786))

(assert (not b!40772))

(assert (not b!40774))

(assert (not b!40787))

(assert (not b!40782))

(assert (not b!40781))

(assert (not b!40776))

(assert (not b!40778))

(assert (not b!40788))

(assert (not b!40777))

(assert (not b!40789))

(assert (not b!40783))

(assert (not b!40780))

(assert (not b!40792))

(assert (not b!40775))

(assert (not b!40790))

(assert (not b!40784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

