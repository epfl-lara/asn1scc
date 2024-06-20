; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25478 () Bool)

(assert start!25478)

(declare-fun res!106687 () Bool)

(declare-fun e!85434 () Bool)

(assert (=> start!25478 (=> (not res!106687) (not e!85434))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!5963 0))(
  ( (array!5964 (arr!3314 (Array (_ BitVec 32) (_ BitVec 8))) (size!2697 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!5963)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25478 (= res!106687 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2697 arr!237))))))

(assert (=> start!25478 e!85434))

(assert (=> start!25478 true))

(declare-fun array_inv!2486 (array!5963) Bool)

(assert (=> start!25478 (array_inv!2486 arr!237)))

(declare-datatypes ((BitStream!4658 0))(
  ( (BitStream!4659 (buf!3055 array!5963) (currentByte!5816 (_ BitVec 32)) (currentBit!5811 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4658)

(declare-fun e!85435 () Bool)

(declare-fun inv!12 (BitStream!4658) Bool)

(assert (=> start!25478 (and (inv!12 thiss!1634) e!85435)))

(declare-fun b!128880 () Bool)

(declare-fun res!106686 () Bool)

(assert (=> b!128880 (=> (not res!106686) (not e!85434))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128880 (= res!106686 (invariant!0 (currentBit!5811 thiss!1634) (currentByte!5816 thiss!1634) (size!2697 (buf!3055 thiss!1634))))))

(declare-fun b!128881 () Bool)

(assert (=> b!128881 (= e!85435 (array_inv!2486 (buf!3055 thiss!1634)))))

(declare-datatypes ((tuple2!10948 0))(
  ( (tuple2!10949 (_1!5771 BitStream!4658) (_2!5771 (_ BitVec 8))) )
))
(declare-fun lt!199628 () tuple2!10948)

(declare-datatypes ((tuple2!10950 0))(
  ( (tuple2!10951 (_1!5772 BitStream!4658) (_2!5772 BitStream!4658)) )
))
(declare-fun lt!199626 () tuple2!10950)

(declare-fun b!128882 () Bool)

(declare-fun e!85433 () Bool)

(assert (=> b!128882 (= e!85433 (and (= (_2!5771 lt!199628) (select (arr!3314 arr!237) from!447)) (= (_1!5771 lt!199628) (_2!5772 lt!199626))))))

(declare-fun readBytePure!0 (BitStream!4658) tuple2!10948)

(assert (=> b!128882 (= lt!199628 (readBytePure!0 (_1!5772 lt!199626)))))

(declare-datatypes ((Unit!7999 0))(
  ( (Unit!8000) )
))
(declare-datatypes ((tuple2!10952 0))(
  ( (tuple2!10953 (_1!5773 Unit!7999) (_2!5773 BitStream!4658)) )
))
(declare-fun lt!199625 () tuple2!10952)

(declare-fun reader!0 (BitStream!4658 BitStream!4658) tuple2!10950)

(assert (=> b!128882 (= lt!199626 (reader!0 thiss!1634 (_2!5773 lt!199625)))))

(declare-fun b!128883 () Bool)

(declare-fun res!106688 () Bool)

(assert (=> b!128883 (=> (not res!106688) (not e!85433))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128883 (= res!106688 (= (bitIndex!0 (size!2697 (buf!3055 (_2!5773 lt!199625))) (currentByte!5816 (_2!5773 lt!199625)) (currentBit!5811 (_2!5773 lt!199625))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2697 (buf!3055 thiss!1634)) (currentByte!5816 thiss!1634) (currentBit!5811 thiss!1634)))))))

(declare-fun b!128884 () Bool)

(declare-fun res!106693 () Bool)

(assert (=> b!128884 (=> (not res!106693) (not e!85434))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128884 (= res!106693 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2697 (buf!3055 thiss!1634))) ((_ sign_extend 32) (currentByte!5816 thiss!1634)) ((_ sign_extend 32) (currentBit!5811 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128885 () Bool)

(declare-fun e!85431 () Bool)

(assert (=> b!128885 (= e!85434 (not e!85431))))

(declare-fun res!106689 () Bool)

(assert (=> b!128885 (=> res!106689 e!85431)))

(assert (=> b!128885 (= res!106689 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2697 (buf!3055 (_2!5773 lt!199625))) (currentByte!5816 (_2!5773 lt!199625)) (currentBit!5811 (_2!5773 lt!199625)))))))

(assert (=> b!128885 e!85433))

(declare-fun res!106690 () Bool)

(assert (=> b!128885 (=> (not res!106690) (not e!85433))))

(assert (=> b!128885 (= res!106690 (= (size!2697 (buf!3055 thiss!1634)) (size!2697 (buf!3055 (_2!5773 lt!199625)))))))

(declare-fun appendByte!0 (BitStream!4658 (_ BitVec 8)) tuple2!10952)

(assert (=> b!128885 (= lt!199625 (appendByte!0 thiss!1634 (select (arr!3314 arr!237) from!447)))))

(declare-fun b!128886 () Bool)

(declare-fun res!106692 () Bool)

(assert (=> b!128886 (=> (not res!106692) (not e!85434))))

(assert (=> b!128886 (= res!106692 (bvslt from!447 to!404))))

(declare-fun b!128887 () Bool)

(assert (=> b!128887 (= e!85431 true)))

(declare-fun lt!199627 () (_ BitVec 64))

(assert (=> b!128887 (= lt!199627 (bitIndex!0 (size!2697 (buf!3055 thiss!1634)) (currentByte!5816 thiss!1634) (currentBit!5811 thiss!1634)))))

(declare-fun b!128888 () Bool)

(declare-fun res!106691 () Bool)

(assert (=> b!128888 (=> (not res!106691) (not e!85433))))

(declare-fun isPrefixOf!0 (BitStream!4658 BitStream!4658) Bool)

(assert (=> b!128888 (= res!106691 (isPrefixOf!0 thiss!1634 (_2!5773 lt!199625)))))

(assert (= (and start!25478 res!106687) b!128884))

(assert (= (and b!128884 res!106693) b!128886))

(assert (= (and b!128886 res!106692) b!128880))

(assert (= (and b!128880 res!106686) b!128885))

(assert (= (and b!128885 res!106690) b!128883))

(assert (= (and b!128883 res!106688) b!128888))

(assert (= (and b!128888 res!106691) b!128882))

(assert (= (and b!128885 (not res!106689)) b!128887))

(assert (= start!25478 b!128881))

(declare-fun m!194629 () Bool)

(assert (=> b!128882 m!194629))

(declare-fun m!194631 () Bool)

(assert (=> b!128882 m!194631))

(declare-fun m!194633 () Bool)

(assert (=> b!128882 m!194633))

(declare-fun m!194635 () Bool)

(assert (=> b!128885 m!194635))

(assert (=> b!128885 m!194629))

(assert (=> b!128885 m!194629))

(declare-fun m!194637 () Bool)

(assert (=> b!128885 m!194637))

(declare-fun m!194639 () Bool)

(assert (=> b!128884 m!194639))

(declare-fun m!194641 () Bool)

(assert (=> b!128881 m!194641))

(assert (=> b!128883 m!194635))

(declare-fun m!194643 () Bool)

(assert (=> b!128883 m!194643))

(declare-fun m!194645 () Bool)

(assert (=> b!128880 m!194645))

(declare-fun m!194647 () Bool)

(assert (=> start!25478 m!194647))

(declare-fun m!194649 () Bool)

(assert (=> start!25478 m!194649))

(declare-fun m!194651 () Bool)

(assert (=> b!128888 m!194651))

(assert (=> b!128887 m!194643))

(push 1)

