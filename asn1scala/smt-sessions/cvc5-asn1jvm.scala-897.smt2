; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25456 () Bool)

(assert start!25456)

(declare-datatypes ((array!5941 0))(
  ( (array!5942 (arr!3303 (Array (_ BitVec 32) (_ BitVec 8))) (size!2686 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4636 0))(
  ( (BitStream!4637 (buf!3044 array!5941) (currentByte!5805 (_ BitVec 32)) (currentBit!5800 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10882 0))(
  ( (tuple2!10883 (_1!5738 BitStream!4636) (_2!5738 BitStream!4636)) )
))
(declare-fun lt!199494 () tuple2!10882)

(declare-fun b!128583 () Bool)

(declare-datatypes ((tuple2!10884 0))(
  ( (tuple2!10885 (_1!5739 BitStream!4636) (_2!5739 (_ BitVec 8))) )
))
(declare-fun lt!199493 () tuple2!10884)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun e!85233 () Bool)

(declare-fun arr!237 () array!5941)

(assert (=> b!128583 (= e!85233 (and (= (_2!5739 lt!199493) (select (arr!3303 arr!237) from!447)) (= (_1!5739 lt!199493) (_2!5738 lt!199494))))))

(declare-fun readBytePure!0 (BitStream!4636) tuple2!10884)

(assert (=> b!128583 (= lt!199493 (readBytePure!0 (_1!5738 lt!199494)))))

(declare-fun thiss!1634 () BitStream!4636)

(declare-datatypes ((Unit!7977 0))(
  ( (Unit!7978) )
))
(declare-datatypes ((tuple2!10886 0))(
  ( (tuple2!10887 (_1!5740 Unit!7977) (_2!5740 BitStream!4636)) )
))
(declare-fun lt!199496 () tuple2!10886)

(declare-fun reader!0 (BitStream!4636 BitStream!4636) tuple2!10882)

(assert (=> b!128583 (= lt!199494 (reader!0 thiss!1634 (_2!5740 lt!199496)))))

(declare-fun b!128584 () Bool)

(declare-fun res!106422 () Bool)

(declare-fun e!85235 () Bool)

(assert (=> b!128584 (=> (not res!106422) (not e!85235))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!128584 (= res!106422 (bvslt from!447 to!404))))

(declare-fun b!128585 () Bool)

(declare-fun e!85237 () Bool)

(assert (=> b!128585 (= e!85235 (not e!85237))))

(declare-fun res!106425 () Bool)

(assert (=> b!128585 (=> res!106425 e!85237)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128585 (= res!106425 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2686 (buf!3044 (_2!5740 lt!199496))) (currentByte!5805 (_2!5740 lt!199496)) (currentBit!5800 (_2!5740 lt!199496)))))))

(assert (=> b!128585 e!85233))

(declare-fun res!106426 () Bool)

(assert (=> b!128585 (=> (not res!106426) (not e!85233))))

(assert (=> b!128585 (= res!106426 (= (size!2686 (buf!3044 thiss!1634)) (size!2686 (buf!3044 (_2!5740 lt!199496)))))))

(declare-fun appendByte!0 (BitStream!4636 (_ BitVec 8)) tuple2!10886)

(assert (=> b!128585 (= lt!199496 (appendByte!0 thiss!1634 (select (arr!3303 arr!237) from!447)))))

(declare-fun b!128586 () Bool)

(declare-fun res!106429 () Bool)

(assert (=> b!128586 (=> (not res!106429) (not e!85235))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128586 (= res!106429 (invariant!0 (currentBit!5800 thiss!1634) (currentByte!5805 thiss!1634) (size!2686 (buf!3044 thiss!1634))))))

(declare-fun b!128587 () Bool)

(declare-fun res!106424 () Bool)

(assert (=> b!128587 (=> (not res!106424) (not e!85235))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128587 (= res!106424 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2686 (buf!3044 thiss!1634))) ((_ sign_extend 32) (currentByte!5805 thiss!1634)) ((_ sign_extend 32) (currentBit!5800 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!106427 () Bool)

(assert (=> start!25456 (=> (not res!106427) (not e!85235))))

(assert (=> start!25456 (= res!106427 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2686 arr!237))))))

(assert (=> start!25456 e!85235))

(assert (=> start!25456 true))

(declare-fun array_inv!2475 (array!5941) Bool)

(assert (=> start!25456 (array_inv!2475 arr!237)))

(declare-fun e!85236 () Bool)

(declare-fun inv!12 (BitStream!4636) Bool)

(assert (=> start!25456 (and (inv!12 thiss!1634) e!85236)))

(declare-fun b!128588 () Bool)

(assert (=> b!128588 (= e!85236 (array_inv!2475 (buf!3044 thiss!1634)))))

(declare-fun b!128589 () Bool)

(declare-fun res!106428 () Bool)

(assert (=> b!128589 (=> (not res!106428) (not e!85233))))

(assert (=> b!128589 (= res!106428 (= (bitIndex!0 (size!2686 (buf!3044 (_2!5740 lt!199496))) (currentByte!5805 (_2!5740 lt!199496)) (currentBit!5800 (_2!5740 lt!199496))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2686 (buf!3044 thiss!1634)) (currentByte!5805 thiss!1634) (currentBit!5800 thiss!1634)))))))

(declare-fun b!128590 () Bool)

(declare-fun res!106423 () Bool)

(assert (=> b!128590 (=> (not res!106423) (not e!85233))))

(declare-fun isPrefixOf!0 (BitStream!4636 BitStream!4636) Bool)

(assert (=> b!128590 (= res!106423 (isPrefixOf!0 thiss!1634 (_2!5740 lt!199496)))))

(declare-fun b!128591 () Bool)

(assert (=> b!128591 (= e!85237 true)))

(declare-fun lt!199495 () (_ BitVec 64))

(assert (=> b!128591 (= lt!199495 (bitIndex!0 (size!2686 (buf!3044 thiss!1634)) (currentByte!5805 thiss!1634) (currentBit!5800 thiss!1634)))))

(assert (= (and start!25456 res!106427) b!128587))

(assert (= (and b!128587 res!106424) b!128584))

(assert (= (and b!128584 res!106422) b!128586))

(assert (= (and b!128586 res!106429) b!128585))

(assert (= (and b!128585 res!106426) b!128589))

(assert (= (and b!128589 res!106428) b!128590))

(assert (= (and b!128590 res!106423) b!128583))

(assert (= (and b!128585 (not res!106425)) b!128591))

(assert (= start!25456 b!128588))

(declare-fun m!194365 () Bool)

(assert (=> b!128588 m!194365))

(declare-fun m!194367 () Bool)

(assert (=> b!128583 m!194367))

(declare-fun m!194369 () Bool)

(assert (=> b!128583 m!194369))

(declare-fun m!194371 () Bool)

(assert (=> b!128583 m!194371))

(declare-fun m!194373 () Bool)

(assert (=> b!128590 m!194373))

(declare-fun m!194375 () Bool)

(assert (=> b!128585 m!194375))

(assert (=> b!128585 m!194367))

(assert (=> b!128585 m!194367))

(declare-fun m!194377 () Bool)

(assert (=> b!128585 m!194377))

(declare-fun m!194379 () Bool)

(assert (=> b!128591 m!194379))

(declare-fun m!194381 () Bool)

(assert (=> start!25456 m!194381))

(declare-fun m!194383 () Bool)

(assert (=> start!25456 m!194383))

(declare-fun m!194385 () Bool)

(assert (=> b!128587 m!194385))

(assert (=> b!128589 m!194375))

(assert (=> b!128589 m!194379))

(declare-fun m!194387 () Bool)

(assert (=> b!128586 m!194387))

(push 1)

(assert (not b!128587))

(assert (not b!128586))

(assert (not b!128591))

(assert (not b!128590))

(assert (not b!128583))

(assert (not b!128585))

(assert (not b!128588))

(assert (not start!25456))

(assert (not b!128589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

