; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!9276 () Bool)

(assert start!9276)

(declare-fun b!46120 () Bool)

(declare-fun res!38973 () Bool)

(declare-fun e!30669 () Bool)

(assert (=> b!46120 (=> res!38973 e!30669)))

(declare-datatypes ((array!2282 0))(
  ( (array!2283 (arr!1546 (Array (_ BitVec 32) (_ BitVec 8))) (size!1029 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1796 0))(
  ( (BitStream!1797 (buf!1378 array!2282) (currentByte!2877 (_ BitVec 32)) (currentBit!2872 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!3271 0))(
  ( (Unit!3272) )
))
(declare-datatypes ((tuple2!4484 0))(
  ( (tuple2!4485 (_1!2335 Unit!3271) (_2!2335 BitStream!1796)) )
))
(declare-fun lt!71058 () tuple2!4484)

(declare-fun lt!71061 () tuple2!4484)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!46120 (= res!38973 (not (invariant!0 (currentBit!2872 (_2!2335 lt!71058)) (currentByte!2877 (_2!2335 lt!71058)) (size!1029 (buf!1378 (_2!2335 lt!71061))))))))

(declare-fun res!38969 () Bool)

(declare-fun e!30666 () Bool)

(assert (=> start!9276 (=> (not res!38969) (not e!30666))))

(declare-fun srcBuffer!2 () array!2282)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!9276 (= res!38969 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1029 srcBuffer!2))))))))

(assert (=> start!9276 e!30666))

(assert (=> start!9276 true))

(declare-fun array_inv!951 (array!2282) Bool)

(assert (=> start!9276 (array_inv!951 srcBuffer!2)))

(declare-fun thiss!1379 () BitStream!1796)

(declare-fun e!30671 () Bool)

(declare-fun inv!12 (BitStream!1796) Bool)

(assert (=> start!9276 (and (inv!12 thiss!1379) e!30671)))

(declare-fun b!46121 () Bool)

(declare-fun e!30664 () Bool)

(assert (=> b!46121 (= e!30664 e!30669)))

(declare-fun res!38967 () Bool)

(assert (=> b!46121 (=> res!38967 e!30669)))

(assert (=> b!46121 (= res!38967 (not (= (size!1029 (buf!1378 (_2!2335 lt!71058))) (size!1029 (buf!1378 (_2!2335 lt!71061))))))))

(declare-fun e!30670 () Bool)

(assert (=> b!46121 e!30670))

(declare-fun res!38972 () Bool)

(assert (=> b!46121 (=> (not res!38972) (not e!30670))))

(assert (=> b!46121 (= res!38972 (= (size!1029 (buf!1378 (_2!2335 lt!71061))) (size!1029 (buf!1378 thiss!1379))))))

(declare-fun b!46122 () Bool)

(assert (=> b!46122 (= e!30671 (array_inv!951 (buf!1378 thiss!1379)))))

(declare-fun e!30673 () Bool)

(declare-fun b!46123 () Bool)

(declare-datatypes ((tuple2!4486 0))(
  ( (tuple2!4487 (_1!2336 BitStream!1796) (_2!2336 BitStream!1796)) )
))
(declare-fun lt!71050 () tuple2!4486)

(declare-datatypes ((List!539 0))(
  ( (Nil!536) (Cons!535 (h!654 Bool) (t!1289 List!539)) )
))
(declare-fun head!358 (List!539) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1796 array!2282 (_ BitVec 64) (_ BitVec 64)) List!539)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1796 BitStream!1796 (_ BitVec 64)) List!539)

(assert (=> b!46123 (= e!30673 (= (head!358 (byteArrayBitContentToList!0 (_2!2335 lt!71058) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!358 (bitStreamReadBitsIntoList!0 (_2!2335 lt!71058) (_1!2336 lt!71050) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!46124 () Bool)

(declare-fun res!38963 () Bool)

(declare-fun e!30668 () Bool)

(assert (=> b!46124 (=> res!38963 e!30668)))

(declare-fun lt!71054 () List!539)

(declare-fun length!234 (List!539) Int)

(assert (=> b!46124 (= res!38963 (<= (length!234 lt!71054) 0))))

(declare-fun b!46125 () Bool)

(declare-fun e!30663 () Bool)

(declare-fun e!30674 () Bool)

(assert (=> b!46125 (= e!30663 e!30674)))

(declare-fun res!38976 () Bool)

(assert (=> b!46125 (=> res!38976 e!30674)))

(declare-fun isPrefixOf!0 (BitStream!1796 BitStream!1796) Bool)

(assert (=> b!46125 (= res!38976 (not (isPrefixOf!0 thiss!1379 (_2!2335 lt!71058))))))

(declare-fun lt!71049 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!46125 (validate_offset_bits!1 ((_ sign_extend 32) (size!1029 (buf!1378 (_2!2335 lt!71058)))) ((_ sign_extend 32) (currentByte!2877 (_2!2335 lt!71058))) ((_ sign_extend 32) (currentBit!2872 (_2!2335 lt!71058))) lt!71049)))

(assert (=> b!46125 (= lt!71049 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71063 () Unit!3271)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1796 BitStream!1796 (_ BitVec 64) (_ BitVec 64)) Unit!3271)

(assert (=> b!46125 (= lt!71063 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2335 lt!71058) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1796 (_ BitVec 8) (_ BitVec 32)) tuple2!4484)

(assert (=> b!46125 (= lt!71058 (appendBitFromByte!0 thiss!1379 (select (arr!1546 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!46126 () Bool)

(assert (=> b!46126 (= e!30669 e!30668)))

(declare-fun res!38971 () Bool)

(assert (=> b!46126 (=> res!38971 e!30668)))

(assert (=> b!46126 (= res!38971 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!71062 () tuple2!4486)

(declare-fun lt!71052 () List!539)

(assert (=> b!46126 (= lt!71052 (bitStreamReadBitsIntoList!0 (_2!2335 lt!71061) (_1!2336 lt!71062) lt!71049))))

(declare-fun lt!71048 () tuple2!4486)

(assert (=> b!46126 (= lt!71054 (bitStreamReadBitsIntoList!0 (_2!2335 lt!71061) (_1!2336 lt!71048) (bvsub to!314 i!635)))))

(assert (=> b!46126 (validate_offset_bits!1 ((_ sign_extend 32) (size!1029 (buf!1378 (_2!2335 lt!71061)))) ((_ sign_extend 32) (currentByte!2877 (_2!2335 lt!71058))) ((_ sign_extend 32) (currentBit!2872 (_2!2335 lt!71058))) lt!71049)))

(declare-fun lt!71051 () Unit!3271)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1796 array!2282 (_ BitVec 64)) Unit!3271)

(assert (=> b!46126 (= lt!71051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2335 lt!71058) (buf!1378 (_2!2335 lt!71061)) lt!71049))))

(declare-fun reader!0 (BitStream!1796 BitStream!1796) tuple2!4486)

(assert (=> b!46126 (= lt!71062 (reader!0 (_2!2335 lt!71058) (_2!2335 lt!71061)))))

(assert (=> b!46126 (validate_offset_bits!1 ((_ sign_extend 32) (size!1029 (buf!1378 (_2!2335 lt!71061)))) ((_ sign_extend 32) (currentByte!2877 thiss!1379)) ((_ sign_extend 32) (currentBit!2872 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!71065 () Unit!3271)

(assert (=> b!46126 (= lt!71065 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1378 (_2!2335 lt!71061)) (bvsub to!314 i!635)))))

(assert (=> b!46126 (= lt!71048 (reader!0 thiss!1379 (_2!2335 lt!71061)))))

(declare-fun b!46127 () Bool)

(declare-fun res!38974 () Bool)

(assert (=> b!46127 (=> res!38974 e!30664)))

(assert (=> b!46127 (= res!38974 (not (invariant!0 (currentBit!2872 (_2!2335 lt!71061)) (currentByte!2877 (_2!2335 lt!71061)) (size!1029 (buf!1378 (_2!2335 lt!71061))))))))

(declare-fun b!46128 () Bool)

(declare-fun res!38968 () Bool)

(assert (=> b!46128 (=> (not res!38968) (not e!30666))))

(assert (=> b!46128 (= res!38968 (validate_offset_bits!1 ((_ sign_extend 32) (size!1029 (buf!1378 thiss!1379))) ((_ sign_extend 32) (currentByte!2877 thiss!1379)) ((_ sign_extend 32) (currentBit!2872 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!46129 () Bool)

(declare-fun e!30665 () Bool)

(assert (=> b!46129 (= e!30674 e!30665)))

(declare-fun res!38966 () Bool)

(assert (=> b!46129 (=> res!38966 e!30665)))

(assert (=> b!46129 (= res!38966 (not (isPrefixOf!0 (_2!2335 lt!71058) (_2!2335 lt!71061))))))

(assert (=> b!46129 (isPrefixOf!0 thiss!1379 (_2!2335 lt!71061))))

(declare-fun lt!71057 () Unit!3271)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1796 BitStream!1796 BitStream!1796) Unit!3271)

(assert (=> b!46129 (= lt!71057 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2335 lt!71058) (_2!2335 lt!71061)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1796 array!2282 (_ BitVec 64) (_ BitVec 64)) tuple2!4484)

(assert (=> b!46129 (= lt!71061 (appendBitsMSBFirstLoop!0 (_2!2335 lt!71058) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!46129 e!30673))

(declare-fun res!38970 () Bool)

(assert (=> b!46129 (=> (not res!38970) (not e!30673))))

(assert (=> b!46129 (= res!38970 (validate_offset_bits!1 ((_ sign_extend 32) (size!1029 (buf!1378 (_2!2335 lt!71058)))) ((_ sign_extend 32) (currentByte!2877 thiss!1379)) ((_ sign_extend 32) (currentBit!2872 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!71060 () Unit!3271)

(assert (=> b!46129 (= lt!71060 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1378 (_2!2335 lt!71058)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!46129 (= lt!71050 (reader!0 thiss!1379 (_2!2335 lt!71058)))))

(declare-fun b!46130 () Bool)

(declare-fun res!38962 () Bool)

(assert (=> b!46130 (=> res!38962 e!30664)))

(assert (=> b!46130 (= res!38962 (not (= (size!1029 (buf!1378 thiss!1379)) (size!1029 (buf!1378 (_2!2335 lt!71061))))))))

(declare-fun b!46131 () Bool)

(declare-fun res!38975 () Bool)

(assert (=> b!46131 (=> res!38975 e!30669)))

(assert (=> b!46131 (= res!38975 (not (invariant!0 (currentBit!2872 (_2!2335 lt!71058)) (currentByte!2877 (_2!2335 lt!71058)) (size!1029 (buf!1378 (_2!2335 lt!71058))))))))

(declare-fun b!46132 () Bool)

(assert (=> b!46132 (= e!30665 e!30664)))

(declare-fun res!38965 () Bool)

(assert (=> b!46132 (=> res!38965 e!30664)))

(declare-fun lt!71055 () (_ BitVec 64))

(declare-fun lt!71059 () (_ BitVec 64))

(assert (=> b!46132 (= res!38965 (not (= lt!71059 (bvsub (bvadd lt!71055 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!46132 (= lt!71059 (bitIndex!0 (size!1029 (buf!1378 (_2!2335 lt!71061))) (currentByte!2877 (_2!2335 lt!71061)) (currentBit!2872 (_2!2335 lt!71061))))))

(declare-fun b!46133 () Bool)

(assert (=> b!46133 (= e!30666 (not e!30663))))

(declare-fun res!38964 () Bool)

(assert (=> b!46133 (=> res!38964 e!30663)))

(assert (=> b!46133 (= res!38964 (bvsge i!635 to!314))))

(assert (=> b!46133 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!71056 () Unit!3271)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1796) Unit!3271)

(assert (=> b!46133 (= lt!71056 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!46133 (= lt!71055 (bitIndex!0 (size!1029 (buf!1378 thiss!1379)) (currentByte!2877 thiss!1379) (currentBit!2872 thiss!1379)))))

(declare-fun b!46134 () Bool)

(assert (=> b!46134 (= e!30670 (= lt!71059 (bvsub (bvsub (bvadd (bitIndex!0 (size!1029 (buf!1378 (_2!2335 lt!71058))) (currentByte!2877 (_2!2335 lt!71058)) (currentBit!2872 (_2!2335 lt!71058))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!46135 () Bool)

(declare-fun lt!71053 () List!539)

(assert (=> b!46135 (= e!30668 (= lt!71053 lt!71052))))

(assert (=> b!46135 (= lt!71052 lt!71053)))

(declare-fun tail!225 (List!539) List!539)

(assert (=> b!46135 (= lt!71053 (tail!225 lt!71054))))

(declare-fun lt!71064 () Unit!3271)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1796 BitStream!1796 BitStream!1796 BitStream!1796 (_ BitVec 64) List!539) Unit!3271)

(assert (=> b!46135 (= lt!71064 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2335 lt!71061) (_2!2335 lt!71061) (_1!2336 lt!71048) (_1!2336 lt!71062) (bvsub to!314 i!635) lt!71054))))

(assert (= (and start!9276 res!38969) b!46128))

(assert (= (and b!46128 res!38968) b!46133))

(assert (= (and b!46133 (not res!38964)) b!46125))

(assert (= (and b!46125 (not res!38976)) b!46129))

(assert (= (and b!46129 res!38970) b!46123))

(assert (= (and b!46129 (not res!38966)) b!46132))

(assert (= (and b!46132 (not res!38965)) b!46127))

(assert (= (and b!46127 (not res!38974)) b!46130))

(assert (= (and b!46130 (not res!38962)) b!46121))

(assert (= (and b!46121 res!38972) b!46134))

(assert (= (and b!46121 (not res!38967)) b!46131))

(assert (= (and b!46131 (not res!38975)) b!46120))

(assert (= (and b!46120 (not res!38973)) b!46126))

(assert (= (and b!46126 (not res!38971)) b!46124))

(assert (= (and b!46124 (not res!38963)) b!46135))

(assert (= start!9276 b!46122))

(declare-fun m!70549 () Bool)

(assert (=> b!46128 m!70549))

(declare-fun m!70551 () Bool)

(assert (=> b!46129 m!70551))

(declare-fun m!70553 () Bool)

(assert (=> b!46129 m!70553))

(declare-fun m!70555 () Bool)

(assert (=> b!46129 m!70555))

(declare-fun m!70557 () Bool)

(assert (=> b!46129 m!70557))

(declare-fun m!70559 () Bool)

(assert (=> b!46129 m!70559))

(declare-fun m!70561 () Bool)

(assert (=> b!46129 m!70561))

(declare-fun m!70563 () Bool)

(assert (=> b!46129 m!70563))

(declare-fun m!70565 () Bool)

(assert (=> b!46133 m!70565))

(declare-fun m!70567 () Bool)

(assert (=> b!46133 m!70567))

(declare-fun m!70569 () Bool)

(assert (=> b!46133 m!70569))

(declare-fun m!70571 () Bool)

(assert (=> b!46125 m!70571))

(declare-fun m!70573 () Bool)

(assert (=> b!46125 m!70573))

(declare-fun m!70575 () Bool)

(assert (=> b!46125 m!70575))

(assert (=> b!46125 m!70571))

(declare-fun m!70577 () Bool)

(assert (=> b!46125 m!70577))

(declare-fun m!70579 () Bool)

(assert (=> b!46125 m!70579))

(declare-fun m!70581 () Bool)

(assert (=> b!46124 m!70581))

(declare-fun m!70583 () Bool)

(assert (=> b!46135 m!70583))

(declare-fun m!70585 () Bool)

(assert (=> b!46135 m!70585))

(declare-fun m!70587 () Bool)

(assert (=> b!46131 m!70587))

(declare-fun m!70589 () Bool)

(assert (=> b!46126 m!70589))

(declare-fun m!70591 () Bool)

(assert (=> b!46126 m!70591))

(declare-fun m!70593 () Bool)

(assert (=> b!46126 m!70593))

(declare-fun m!70595 () Bool)

(assert (=> b!46126 m!70595))

(declare-fun m!70597 () Bool)

(assert (=> b!46126 m!70597))

(declare-fun m!70599 () Bool)

(assert (=> b!46126 m!70599))

(declare-fun m!70601 () Bool)

(assert (=> b!46126 m!70601))

(declare-fun m!70603 () Bool)

(assert (=> b!46126 m!70603))

(declare-fun m!70605 () Bool)

(assert (=> b!46132 m!70605))

(declare-fun m!70607 () Bool)

(assert (=> b!46123 m!70607))

(assert (=> b!46123 m!70607))

(declare-fun m!70609 () Bool)

(assert (=> b!46123 m!70609))

(declare-fun m!70611 () Bool)

(assert (=> b!46123 m!70611))

(assert (=> b!46123 m!70611))

(declare-fun m!70613 () Bool)

(assert (=> b!46123 m!70613))

(declare-fun m!70615 () Bool)

(assert (=> b!46122 m!70615))

(declare-fun m!70617 () Bool)

(assert (=> b!46127 m!70617))

(declare-fun m!70619 () Bool)

(assert (=> b!46120 m!70619))

(declare-fun m!70621 () Bool)

(assert (=> b!46134 m!70621))

(declare-fun m!70623 () Bool)

(assert (=> start!9276 m!70623))

(declare-fun m!70625 () Bool)

(assert (=> start!9276 m!70625))

(push 1)

(assert (not b!46122))

(assert (not b!46131))

(assert (not b!46135))

(assert (not b!46133))

(assert (not b!46125))

(assert (not b!46120))

(assert (not b!46127))

(assert (not b!46126))

(assert (not b!46129))

(assert (not b!46128))

(assert (not b!46124))

(assert (not b!46132))

(assert (not b!46123))

(assert (not b!46134))

(assert (not start!9276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

