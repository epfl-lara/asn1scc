; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25468 () Bool)

(assert start!25468)

(declare-fun b!128745 () Bool)

(declare-fun e!85346 () Bool)

(assert (=> b!128745 (= e!85346 true)))

(declare-fun lt!199566 () (_ BitVec 64))

(declare-datatypes ((array!5953 0))(
  ( (array!5954 (arr!3309 (Array (_ BitVec 32) (_ BitVec 8))) (size!2692 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4648 0))(
  ( (BitStream!4649 (buf!3050 array!5953) (currentByte!5811 (_ BitVec 32)) (currentBit!5806 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!4648)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128745 (= lt!199566 (bitIndex!0 (size!2692 (buf!3050 thiss!1634)) (currentByte!5811 thiss!1634) (currentBit!5806 thiss!1634)))))

(declare-fun b!128746 () Bool)

(declare-fun res!106566 () Bool)

(declare-fun e!85343 () Bool)

(assert (=> b!128746 (=> (not res!106566) (not e!85343))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128746 (= res!106566 (invariant!0 (currentBit!5806 thiss!1634) (currentByte!5811 thiss!1634) (size!2692 (buf!3050 thiss!1634))))))

(declare-fun res!106571 () Bool)

(assert (=> start!25468 (=> (not res!106571) (not e!85343))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arr!237 () array!5953)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!25468 (= res!106571 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2692 arr!237))))))

(assert (=> start!25468 e!85343))

(assert (=> start!25468 true))

(declare-fun array_inv!2481 (array!5953) Bool)

(assert (=> start!25468 (array_inv!2481 arr!237)))

(declare-fun e!85344 () Bool)

(declare-fun inv!12 (BitStream!4648) Bool)

(assert (=> start!25468 (and (inv!12 thiss!1634) e!85344)))

(declare-fun b!128747 () Bool)

(declare-fun res!106573 () Bool)

(declare-fun e!85341 () Bool)

(assert (=> b!128747 (=> (not res!106573) (not e!85341))))

(declare-datatypes ((Unit!7989 0))(
  ( (Unit!7990) )
))
(declare-datatypes ((tuple2!10918 0))(
  ( (tuple2!10919 (_1!5756 Unit!7989) (_2!5756 BitStream!4648)) )
))
(declare-fun lt!199565 () tuple2!10918)

(declare-fun isPrefixOf!0 (BitStream!4648 BitStream!4648) Bool)

(assert (=> b!128747 (= res!106573 (isPrefixOf!0 thiss!1634 (_2!5756 lt!199565)))))

(declare-datatypes ((tuple2!10920 0))(
  ( (tuple2!10921 (_1!5757 BitStream!4648) (_2!5757 (_ BitVec 8))) )
))
(declare-fun lt!199568 () tuple2!10920)

(declare-fun b!128748 () Bool)

(declare-datatypes ((tuple2!10922 0))(
  ( (tuple2!10923 (_1!5758 BitStream!4648) (_2!5758 BitStream!4648)) )
))
(declare-fun lt!199567 () tuple2!10922)

(assert (=> b!128748 (= e!85341 (and (= (_2!5757 lt!199568) (select (arr!3309 arr!237) from!447)) (= (_1!5757 lt!199568) (_2!5758 lt!199567))))))

(declare-fun readBytePure!0 (BitStream!4648) tuple2!10920)

(assert (=> b!128748 (= lt!199568 (readBytePure!0 (_1!5758 lt!199567)))))

(declare-fun reader!0 (BitStream!4648 BitStream!4648) tuple2!10922)

(assert (=> b!128748 (= lt!199567 (reader!0 thiss!1634 (_2!5756 lt!199565)))))

(declare-fun b!128749 () Bool)

(assert (=> b!128749 (= e!85343 (not e!85346))))

(declare-fun res!106569 () Bool)

(assert (=> b!128749 (=> res!106569 e!85346)))

(assert (=> b!128749 (= res!106569 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2692 (buf!3050 (_2!5756 lt!199565))) (currentByte!5811 (_2!5756 lt!199565)) (currentBit!5806 (_2!5756 lt!199565)))))))

(assert (=> b!128749 e!85341))

(declare-fun res!106567 () Bool)

(assert (=> b!128749 (=> (not res!106567) (not e!85341))))

(assert (=> b!128749 (= res!106567 (= (size!2692 (buf!3050 thiss!1634)) (size!2692 (buf!3050 (_2!5756 lt!199565)))))))

(declare-fun appendByte!0 (BitStream!4648 (_ BitVec 8)) tuple2!10918)

(assert (=> b!128749 (= lt!199565 (appendByte!0 thiss!1634 (select (arr!3309 arr!237) from!447)))))

(declare-fun b!128750 () Bool)

(assert (=> b!128750 (= e!85344 (array_inv!2481 (buf!3050 thiss!1634)))))

(declare-fun b!128751 () Bool)

(declare-fun res!106572 () Bool)

(assert (=> b!128751 (=> (not res!106572) (not e!85343))))

(assert (=> b!128751 (= res!106572 (bvslt from!447 to!404))))

(declare-fun b!128752 () Bool)

(declare-fun res!106568 () Bool)

(assert (=> b!128752 (=> (not res!106568) (not e!85341))))

(assert (=> b!128752 (= res!106568 (= (bitIndex!0 (size!2692 (buf!3050 (_2!5756 lt!199565))) (currentByte!5811 (_2!5756 lt!199565)) (currentBit!5806 (_2!5756 lt!199565))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2692 (buf!3050 thiss!1634)) (currentByte!5811 thiss!1634) (currentBit!5806 thiss!1634)))))))

(declare-fun b!128753 () Bool)

(declare-fun res!106570 () Bool)

(assert (=> b!128753 (=> (not res!106570) (not e!85343))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128753 (= res!106570 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2692 (buf!3050 thiss!1634))) ((_ sign_extend 32) (currentByte!5811 thiss!1634)) ((_ sign_extend 32) (currentBit!5806 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!25468 res!106571) b!128753))

(assert (= (and b!128753 res!106570) b!128751))

(assert (= (and b!128751 res!106572) b!128746))

(assert (= (and b!128746 res!106566) b!128749))

(assert (= (and b!128749 res!106567) b!128752))

(assert (= (and b!128752 res!106568) b!128747))

(assert (= (and b!128747 res!106573) b!128748))

(assert (= (and b!128749 (not res!106569)) b!128745))

(assert (= start!25468 b!128750))

(declare-fun m!194509 () Bool)

(assert (=> b!128753 m!194509))

(declare-fun m!194511 () Bool)

(assert (=> b!128746 m!194511))

(declare-fun m!194513 () Bool)

(assert (=> b!128745 m!194513))

(declare-fun m!194515 () Bool)

(assert (=> start!25468 m!194515))

(declare-fun m!194517 () Bool)

(assert (=> start!25468 m!194517))

(declare-fun m!194519 () Bool)

(assert (=> b!128749 m!194519))

(declare-fun m!194521 () Bool)

(assert (=> b!128749 m!194521))

(assert (=> b!128749 m!194521))

(declare-fun m!194523 () Bool)

(assert (=> b!128749 m!194523))

(declare-fun m!194525 () Bool)

(assert (=> b!128750 m!194525))

(declare-fun m!194527 () Bool)

(assert (=> b!128747 m!194527))

(assert (=> b!128748 m!194521))

(declare-fun m!194529 () Bool)

(assert (=> b!128748 m!194529))

(declare-fun m!194531 () Bool)

(assert (=> b!128748 m!194531))

(assert (=> b!128752 m!194519))

(assert (=> b!128752 m!194513))

(push 1)

(assert (not b!128750))

(assert (not b!128745))

(assert (not b!128747))

(assert (not start!25468))

(assert (not b!128752))

(assert (not b!128748))

(assert (not b!128746))

(assert (not b!128753))

(assert (not b!128749))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

