; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25460 () Bool)

(assert start!25460)

(declare-fun b!128637 () Bool)

(declare-fun res!106476 () Bool)

(declare-fun e!85274 () Bool)

(assert (=> b!128637 (=> (not res!106476) (not e!85274))))

(declare-datatypes ((array!5945 0))(
  ( (array!5946 (arr!3305 (Array (_ BitVec 32) (_ BitVec 8))) (size!2688 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4640 0))(
  ( (BitStream!4641 (buf!3046 array!5945) (currentByte!5807 (_ BitVec 32)) (currentBit!5802 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7981 0))(
  ( (Unit!7982) )
))
(declare-datatypes ((tuple2!10894 0))(
  ( (tuple2!10895 (_1!5744 Unit!7981) (_2!5744 BitStream!4640)) )
))
(declare-fun lt!199517 () tuple2!10894)

(declare-fun thiss!1634 () BitStream!4640)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128637 (= res!106476 (= (bitIndex!0 (size!2688 (buf!3046 (_2!5744 lt!199517))) (currentByte!5807 (_2!5744 lt!199517)) (currentBit!5802 (_2!5744 lt!199517))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2688 (buf!3046 thiss!1634)) (currentByte!5807 thiss!1634) (currentBit!5802 thiss!1634)))))))

(declare-fun b!128638 () Bool)

(declare-fun e!85270 () Bool)

(assert (=> b!128638 (= e!85270 true)))

(declare-fun lt!199518 () (_ BitVec 64))

(assert (=> b!128638 (= lt!199518 (bitIndex!0 (size!2688 (buf!3046 thiss!1634)) (currentByte!5807 thiss!1634) (currentBit!5802 thiss!1634)))))

(declare-datatypes ((tuple2!10896 0))(
  ( (tuple2!10897 (_1!5745 BitStream!4640) (_2!5745 (_ BitVec 8))) )
))
(declare-fun lt!199519 () tuple2!10896)

(declare-fun b!128639 () Bool)

(declare-fun arr!237 () array!5945)

(declare-datatypes ((tuple2!10898 0))(
  ( (tuple2!10899 (_1!5746 BitStream!4640) (_2!5746 BitStream!4640)) )
))
(declare-fun lt!199520 () tuple2!10898)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> b!128639 (= e!85274 (and (= (_2!5745 lt!199519) (select (arr!3305 arr!237) from!447)) (= (_1!5745 lt!199519) (_2!5746 lt!199520))))))

(declare-fun readBytePure!0 (BitStream!4640) tuple2!10896)

(assert (=> b!128639 (= lt!199519 (readBytePure!0 (_1!5746 lt!199520)))))

(declare-fun reader!0 (BitStream!4640 BitStream!4640) tuple2!10898)

(assert (=> b!128639 (= lt!199520 (reader!0 thiss!1634 (_2!5744 lt!199517)))))

(declare-fun b!128640 () Bool)

(declare-fun res!106477 () Bool)

(assert (=> b!128640 (=> (not res!106477) (not e!85274))))

(declare-fun isPrefixOf!0 (BitStream!4640 BitStream!4640) Bool)

(assert (=> b!128640 (= res!106477 (isPrefixOf!0 thiss!1634 (_2!5744 lt!199517)))))

(declare-fun b!128641 () Bool)

(declare-fun e!85271 () Bool)

(declare-fun array_inv!2477 (array!5945) Bool)

(assert (=> b!128641 (= e!85271 (array_inv!2477 (buf!3046 thiss!1634)))))

(declare-fun b!128642 () Bool)

(declare-fun res!106475 () Bool)

(declare-fun e!85272 () Bool)

(assert (=> b!128642 (=> (not res!106475) (not e!85272))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128642 (= res!106475 (invariant!0 (currentBit!5802 thiss!1634) (currentByte!5807 thiss!1634) (size!2688 (buf!3046 thiss!1634))))))

(declare-fun b!128643 () Bool)

(assert (=> b!128643 (= e!85272 (not e!85270))))

(declare-fun res!106470 () Bool)

(assert (=> b!128643 (=> res!106470 e!85270)))

(assert (=> b!128643 (= res!106470 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2688 (buf!3046 (_2!5744 lt!199517))) (currentByte!5807 (_2!5744 lt!199517)) (currentBit!5802 (_2!5744 lt!199517)))))))

(assert (=> b!128643 e!85274))

(declare-fun res!106472 () Bool)

(assert (=> b!128643 (=> (not res!106472) (not e!85274))))

(assert (=> b!128643 (= res!106472 (= (size!2688 (buf!3046 thiss!1634)) (size!2688 (buf!3046 (_2!5744 lt!199517)))))))

(declare-fun appendByte!0 (BitStream!4640 (_ BitVec 8)) tuple2!10894)

(assert (=> b!128643 (= lt!199517 (appendByte!0 thiss!1634 (select (arr!3305 arr!237) from!447)))))

(declare-fun b!128644 () Bool)

(declare-fun res!106474 () Bool)

(assert (=> b!128644 (=> (not res!106474) (not e!85272))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128644 (= res!106474 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2688 (buf!3046 thiss!1634))) ((_ sign_extend 32) (currentByte!5807 thiss!1634)) ((_ sign_extend 32) (currentBit!5802 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!106471 () Bool)

(assert (=> start!25460 (=> (not res!106471) (not e!85272))))

(assert (=> start!25460 (= res!106471 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2688 arr!237))))))

(assert (=> start!25460 e!85272))

(assert (=> start!25460 true))

(assert (=> start!25460 (array_inv!2477 arr!237)))

(declare-fun inv!12 (BitStream!4640) Bool)

(assert (=> start!25460 (and (inv!12 thiss!1634) e!85271)))

(declare-fun b!128645 () Bool)

(declare-fun res!106473 () Bool)

(assert (=> b!128645 (=> (not res!106473) (not e!85272))))

(assert (=> b!128645 (= res!106473 (bvslt from!447 to!404))))

(assert (= (and start!25460 res!106471) b!128644))

(assert (= (and b!128644 res!106474) b!128645))

(assert (= (and b!128645 res!106473) b!128642))

(assert (= (and b!128642 res!106475) b!128643))

(assert (= (and b!128643 res!106472) b!128637))

(assert (= (and b!128637 res!106476) b!128640))

(assert (= (and b!128640 res!106477) b!128639))

(assert (= (and b!128643 (not res!106470)) b!128638))

(assert (= start!25460 b!128641))

(declare-fun m!194413 () Bool)

(assert (=> b!128641 m!194413))

(declare-fun m!194415 () Bool)

(assert (=> b!128644 m!194415))

(declare-fun m!194417 () Bool)

(assert (=> b!128637 m!194417))

(declare-fun m!194419 () Bool)

(assert (=> b!128637 m!194419))

(assert (=> b!128638 m!194419))

(declare-fun m!194421 () Bool)

(assert (=> b!128639 m!194421))

(declare-fun m!194423 () Bool)

(assert (=> b!128639 m!194423))

(declare-fun m!194425 () Bool)

(assert (=> b!128639 m!194425))

(declare-fun m!194427 () Bool)

(assert (=> b!128640 m!194427))

(declare-fun m!194429 () Bool)

(assert (=> b!128642 m!194429))

(declare-fun m!194431 () Bool)

(assert (=> start!25460 m!194431))

(declare-fun m!194433 () Bool)

(assert (=> start!25460 m!194433))

(assert (=> b!128643 m!194417))

(assert (=> b!128643 m!194421))

(assert (=> b!128643 m!194421))

(declare-fun m!194435 () Bool)

(assert (=> b!128643 m!194435))

(push 1)

(assert (not b!128638))

(assert (not b!128643))

(assert (not b!128644))

(assert (not start!25460))

(assert (not b!128641))

(assert (not b!128640))

(assert (not b!128637))

(assert (not b!128639))

(assert (not b!128642))

(check-sat)

