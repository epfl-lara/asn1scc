; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38500 () Bool)

(assert start!38500)

(declare-fun b!173030 () Bool)

(declare-fun res!143309 () Bool)

(declare-fun e!120863 () Bool)

(assert (=> b!173030 (=> (not res!143309) (not e!120863))))

(declare-datatypes ((array!9306 0))(
  ( (array!9307 (arr!5037 (Array (_ BitVec 32) (_ BitVec 8))) (size!4107 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7322 0))(
  ( (BitStream!7323 (buf!4535 array!9306) (currentByte!8622 (_ BitVec 32)) (currentBit!8617 (_ BitVec 32))) )
))
(declare-fun thiss!1187 () BitStream!7322)

(declare-datatypes ((Unit!12383 0))(
  ( (Unit!12384) )
))
(declare-datatypes ((tuple2!14880 0))(
  ( (tuple2!14881 (_1!8082 Unit!12383) (_2!8082 BitStream!7322)) )
))
(declare-fun lt!266615 () tuple2!14880)

(declare-fun nBits!340 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!173030 (= res!143309 (= (bitIndex!0 (size!4107 (buf!4535 (_2!8082 lt!266615))) (currentByte!8622 (_2!8082 lt!266615)) (currentBit!8617 (_2!8082 lt!266615))) (bvadd (bitIndex!0 (size!4107 (buf!4535 thiss!1187)) (currentByte!8622 thiss!1187) (currentBit!8617 thiss!1187)) ((_ sign_extend 32) nBits!340))))))

(declare-fun b!173031 () Bool)

(declare-fun e!120864 () Bool)

(assert (=> b!173031 (= e!120864 e!120863)))

(declare-fun res!143312 () Bool)

(assert (=> b!173031 (=> (not res!143312) (not e!120863))))

(assert (=> b!173031 (= res!143312 (= (size!4107 (buf!4535 (_2!8082 lt!266615))) (size!4107 (buf!4535 thiss!1187))))))

(declare-fun v!186 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7322 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!14880)

(assert (=> b!173031 (= lt!266615 (appendBitsLSBFirstLoopTR!0 thiss!1187 v!186 nBits!340 #b00000000000000000000000000000000))))

(declare-fun res!143308 () Bool)

(assert (=> start!38500 (=> (not res!143308) (not e!120864))))

(assert (=> start!38500 (= res!143308 (and (bvsge nBits!340 #b00000000000000000000000000000000) (bvsle nBits!340 #b00000000000000000000000001000000)))))

(assert (=> start!38500 e!120864))

(assert (=> start!38500 true))

(declare-fun e!120865 () Bool)

(declare-fun inv!12 (BitStream!7322) Bool)

(assert (=> start!38500 (and (inv!12 thiss!1187) e!120865)))

(declare-fun b!173032 () Bool)

(declare-fun array_inv!3848 (array!9306) Bool)

(assert (=> b!173032 (= e!120865 (array_inv!3848 (buf!4535 thiss!1187)))))

(declare-fun b!173033 () Bool)

(declare-fun res!143313 () Bool)

(assert (=> b!173033 (=> (not res!143313) (not e!120863))))

(assert (=> b!173033 (= res!143313 (= (size!4107 (buf!4535 thiss!1187)) (size!4107 (buf!4535 (_2!8082 lt!266615)))))))

(declare-fun b!173034 () Bool)

(declare-fun res!143311 () Bool)

(assert (=> b!173034 (=> (not res!143311) (not e!120863))))

(declare-fun isPrefixOf!0 (BitStream!7322 BitStream!7322) Bool)

(assert (=> b!173034 (= res!143311 (isPrefixOf!0 thiss!1187 (_2!8082 lt!266615)))))

(declare-fun b!173035 () Bool)

(declare-fun res!143310 () Bool)

(assert (=> b!173035 (=> (not res!143310) (not e!120864))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!173035 (= res!143310 (validate_offset_bits!1 ((_ sign_extend 32) (size!4107 (buf!4535 thiss!1187))) ((_ sign_extend 32) (currentByte!8622 thiss!1187)) ((_ sign_extend 32) (currentBit!8617 thiss!1187)) ((_ sign_extend 32) nBits!340)))))

(declare-fun b!173036 () Bool)

(declare-fun res!143307 () Bool)

(assert (=> b!173036 (=> (not res!143307) (not e!120864))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!173036 (= res!143307 (invariant!0 (currentBit!8617 thiss!1187) (currentByte!8622 thiss!1187) (size!4107 (buf!4535 thiss!1187))))))

(declare-fun b!173037 () Bool)

(assert (=> b!173037 (= e!120863 false)))

(declare-datatypes ((tuple2!14882 0))(
  ( (tuple2!14883 (_1!8083 BitStream!7322) (_2!8083 BitStream!7322)) )
))
(declare-fun lt!266614 () tuple2!14882)

(declare-fun reader!0 (BitStream!7322 BitStream!7322) tuple2!14882)

(assert (=> b!173037 (= lt!266614 (reader!0 thiss!1187 (_2!8082 lt!266615)))))

(assert (= (and start!38500 res!143308) b!173035))

(assert (= (and b!173035 res!143310) b!173036))

(assert (= (and b!173036 res!143307) b!173031))

(assert (= (and b!173031 res!143312) b!173030))

(assert (= (and b!173030 res!143309) b!173033))

(assert (= (and b!173033 res!143313) b!173034))

(assert (= (and b!173034 res!143311) b!173037))

(assert (= start!38500 b!173032))

(declare-fun m!272169 () Bool)

(assert (=> start!38500 m!272169))

(declare-fun m!272171 () Bool)

(assert (=> b!173037 m!272171))

(declare-fun m!272173 () Bool)

(assert (=> b!173030 m!272173))

(declare-fun m!272175 () Bool)

(assert (=> b!173030 m!272175))

(declare-fun m!272177 () Bool)

(assert (=> b!173036 m!272177))

(declare-fun m!272179 () Bool)

(assert (=> b!173031 m!272179))

(declare-fun m!272181 () Bool)

(assert (=> b!173032 m!272181))

(declare-fun m!272183 () Bool)

(assert (=> b!173034 m!272183))

(declare-fun m!272185 () Bool)

(assert (=> b!173035 m!272185))

(push 1)

(assert (not b!173032))

(assert (not b!173031))

(assert (not b!173035))

(assert (not b!173036))

(assert (not start!38500))

(assert (not b!173030))

(assert (not b!173034))

(assert (not b!173037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

