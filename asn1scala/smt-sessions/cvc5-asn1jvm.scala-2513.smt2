; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63508 () Bool)

(assert start!63508)

(declare-fun res!235187 () Bool)

(declare-fun e!202759 () Bool)

(assert (=> start!63508 (=> (not res!235187) (not e!202759))))

(declare-datatypes ((array!16531 0))(
  ( (array!16532 (arr!8134 (Array (_ BitVec 32) (_ BitVec 8))) (size!7138 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12646 0))(
  ( (BitStream!12647 (buf!7384 array!16531) (currentByte!13685 (_ BitVec 32)) (currentBit!13680 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12646)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63508 (= res!235187 (validate_offset_bits!1 ((_ sign_extend 32) (size!7138 (buf!7384 thiss!1939))) ((_ sign_extend 32) (currentByte!13685 thiss!1939)) ((_ sign_extend 32) (currentBit!13680 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13685 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13680 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63508 e!202759))

(declare-fun e!202760 () Bool)

(declare-fun inv!12 (BitStream!12646) Bool)

(assert (=> start!63508 (and (inv!12 thiss!1939) e!202760)))

(declare-fun b!283817 () Bool)

(declare-fun lt!418221 () (_ BitVec 32))

(assert (=> b!283817 (= e!202759 (and (not (= lt!418221 #b00000000000000000000000000000000)) (not (= #b00000000000000000000000000000010 (bvsdiv (bvmul #b00000000000000000000000000000010 lt!418221) lt!418221)))))))

(declare-datatypes ((Unit!19901 0))(
  ( (Unit!19902) )
))
(declare-datatypes ((tuple2!22620 0))(
  ( (tuple2!22621 (_1!12504 Unit!19901) (_2!12504 BitStream!12646)) )
))
(declare-fun alignToByte!0 (BitStream!12646) tuple2!22620)

(assert (=> b!283817 (= lt!418221 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13685 (_2!12504 (alignToByte!0 thiss!1939)))) #b00000000000000000000000000000010))))

(declare-fun b!283818 () Bool)

(declare-fun array_inv!6831 (array!16531) Bool)

(assert (=> b!283818 (= e!202760 (array_inv!6831 (buf!7384 thiss!1939)))))

(assert (= (and start!63508 res!235187) b!283817))

(assert (= start!63508 b!283818))

(declare-fun m!416923 () Bool)

(assert (=> start!63508 m!416923))

(declare-fun m!416925 () Bool)

(assert (=> start!63508 m!416925))

(declare-fun m!416927 () Bool)

(assert (=> b!283817 m!416927))

(declare-fun m!416929 () Bool)

(assert (=> b!283818 m!416929))

(push 1)

(assert (not b!283818))

(assert (not start!63508))

(assert (not b!283817))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

