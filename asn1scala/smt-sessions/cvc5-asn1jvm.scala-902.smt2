; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25486 () Bool)

(assert start!25486)

(declare-fun b!128977 () Bool)

(declare-fun e!85496 () Bool)

(declare-datatypes ((array!5971 0))(
  ( (array!5972 (arr!3318 (Array (_ BitVec 32) (_ BitVec 8))) (size!2701 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4666 0))(
  ( (BitStream!4667 (buf!3059 array!5971) (currentByte!5820 (_ BitVec 32)) (currentBit!5815 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4666)

(declare-fun array_inv!2490 (array!5971) Bool)

(assert (=> b!128977 (= e!85496 (array_inv!2490 (buf!3059 thiss!1634)))))

(declare-fun b!128978 () Bool)

(declare-fun res!106771 () Bool)

(declare-fun e!85495 () Bool)

(assert (=> b!128978 (=> (not res!106771) (not e!85495))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128978 (= res!106771 (invariant!0 (currentBit!5815 thiss!1634) (currentByte!5820 thiss!1634) (size!2701 (buf!3059 thiss!1634))))))

(declare-fun b!128979 () Bool)

(declare-fun res!106772 () Bool)

(assert (=> b!128979 (=> (not res!106772) (not e!85495))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128979 (= res!106772 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2701 (buf!3059 thiss!1634))) ((_ sign_extend 32) (currentByte!5820 thiss!1634)) ((_ sign_extend 32) (currentBit!5815 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128980 () Bool)

(declare-fun res!106775 () Bool)

(declare-fun e!85492 () Bool)

(assert (=> b!128980 (=> (not res!106775) (not e!85492))))

(declare-datatypes ((Unit!8007 0))(
  ( (Unit!8008) )
))
(declare-datatypes ((tuple2!10972 0))(
  ( (tuple2!10973 (_1!5783 Unit!8007) (_2!5783 BitStream!4666)) )
))
(declare-fun lt!199676 () tuple2!10972)

(declare-fun isPrefixOf!0 (BitStream!4666 BitStream!4666) Bool)

(assert (=> b!128980 (= res!106775 (isPrefixOf!0 thiss!1634 (_2!5783 lt!199676)))))

(declare-fun res!106777 () Bool)

(assert (=> start!25486 (=> (not res!106777) (not e!85495))))

(declare-fun arr!237 () array!5971)

(assert (=> start!25486 (= res!106777 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2701 arr!237))))))

(assert (=> start!25486 e!85495))

(assert (=> start!25486 true))

(assert (=> start!25486 (array_inv!2490 arr!237)))

(declare-fun inv!12 (BitStream!4666) Bool)

(assert (=> start!25486 (and (inv!12 thiss!1634) e!85496)))

(declare-fun b!128981 () Bool)

(declare-fun res!106773 () Bool)

(assert (=> b!128981 (=> (not res!106773) (not e!85495))))

(assert (=> b!128981 (= res!106773 (bvslt from!447 to!404))))

(declare-fun b!128982 () Bool)

(assert (=> b!128982 (= e!85495 (not true))))

(assert (=> b!128982 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2701 (buf!3059 (_2!5783 lt!199676)))) ((_ sign_extend 32) (currentByte!5820 (_2!5783 lt!199676))) ((_ sign_extend 32) (currentBit!5815 (_2!5783 lt!199676))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!199674 () Unit!8007)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4666 BitStream!4666 (_ BitVec 64) (_ BitVec 32)) Unit!8007)

(assert (=> b!128982 (= lt!199674 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!5783 lt!199676) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> b!128982 e!85492))

(declare-fun res!106776 () Bool)

(assert (=> b!128982 (=> (not res!106776) (not e!85492))))

(assert (=> b!128982 (= res!106776 (= (size!2701 (buf!3059 thiss!1634)) (size!2701 (buf!3059 (_2!5783 lt!199676)))))))

(declare-fun appendByte!0 (BitStream!4666 (_ BitVec 8)) tuple2!10972)

(assert (=> b!128982 (= lt!199676 (appendByte!0 thiss!1634 (select (arr!3318 arr!237) from!447)))))

(declare-datatypes ((tuple2!10974 0))(
  ( (tuple2!10975 (_1!5784 BitStream!4666) (_2!5784 BitStream!4666)) )
))
(declare-fun lt!199673 () tuple2!10974)

(declare-fun b!128983 () Bool)

(declare-datatypes ((tuple2!10976 0))(
  ( (tuple2!10977 (_1!5785 BitStream!4666) (_2!5785 (_ BitVec 8))) )
))
(declare-fun lt!199675 () tuple2!10976)

(assert (=> b!128983 (= e!85492 (and (= (_2!5785 lt!199675) (select (arr!3318 arr!237) from!447)) (= (_1!5785 lt!199675) (_2!5784 lt!199673))))))

(declare-fun readBytePure!0 (BitStream!4666) tuple2!10976)

(assert (=> b!128983 (= lt!199675 (readBytePure!0 (_1!5784 lt!199673)))))

(declare-fun reader!0 (BitStream!4666 BitStream!4666) tuple2!10974)

(assert (=> b!128983 (= lt!199673 (reader!0 thiss!1634 (_2!5783 lt!199676)))))

(declare-fun b!128984 () Bool)

(declare-fun res!106774 () Bool)

(assert (=> b!128984 (=> (not res!106774) (not e!85492))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128984 (= res!106774 (= (bitIndex!0 (size!2701 (buf!3059 (_2!5783 lt!199676))) (currentByte!5820 (_2!5783 lt!199676)) (currentBit!5815 (_2!5783 lt!199676))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2701 (buf!3059 thiss!1634)) (currentByte!5820 thiss!1634) (currentBit!5815 thiss!1634)))))))

(assert (= (and start!25486 res!106777) b!128979))

(assert (= (and b!128979 res!106772) b!128981))

(assert (= (and b!128981 res!106773) b!128978))

(assert (= (and b!128978 res!106771) b!128982))

(assert (= (and b!128982 res!106776) b!128984))

(assert (= (and b!128984 res!106774) b!128980))

(assert (= (and b!128980 res!106775) b!128983))

(assert (= start!25486 b!128977))

(declare-fun m!194737 () Bool)

(assert (=> b!128980 m!194737))

(declare-fun m!194739 () Bool)

(assert (=> b!128979 m!194739))

(declare-fun m!194741 () Bool)

(assert (=> b!128977 m!194741))

(declare-fun m!194743 () Bool)

(assert (=> b!128984 m!194743))

(declare-fun m!194745 () Bool)

(assert (=> b!128984 m!194745))

(declare-fun m!194747 () Bool)

(assert (=> b!128978 m!194747))

(declare-fun m!194749 () Bool)

(assert (=> b!128982 m!194749))

(declare-fun m!194751 () Bool)

(assert (=> b!128982 m!194751))

(declare-fun m!194753 () Bool)

(assert (=> b!128982 m!194753))

(assert (=> b!128982 m!194753))

(declare-fun m!194755 () Bool)

(assert (=> b!128982 m!194755))

(declare-fun m!194757 () Bool)

(assert (=> start!25486 m!194757))

(declare-fun m!194759 () Bool)

(assert (=> start!25486 m!194759))

(assert (=> b!128983 m!194753))

(declare-fun m!194761 () Bool)

(assert (=> b!128983 m!194761))

(declare-fun m!194763 () Bool)

(assert (=> b!128983 m!194763))

(push 1)

(assert (not b!128984))

(assert (not b!128980))

(assert (not b!128978))

(assert (not b!128982))

(assert (not b!128983))

(assert (not b!128977))

(assert (not start!25486))

(assert (not b!128979))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

