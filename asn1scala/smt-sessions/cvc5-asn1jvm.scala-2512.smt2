; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63502 () Bool)

(assert start!63502)

(declare-fun res!235178 () Bool)

(declare-fun e!202732 () Bool)

(assert (=> start!63502 (=> (not res!235178) (not e!202732))))

(declare-datatypes ((array!16525 0))(
  ( (array!16526 (arr!8131 (Array (_ BitVec 32) (_ BitVec 8))) (size!7135 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12640 0))(
  ( (BitStream!12641 (buf!7381 array!16525) (currentByte!13682 (_ BitVec 32)) (currentBit!13677 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12640)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63502 (= res!235178 (validate_offset_bits!1 ((_ sign_extend 32) (size!7135 (buf!7381 thiss!1939))) ((_ sign_extend 32) (currentByte!13682 thiss!1939)) ((_ sign_extend 32) (currentBit!13677 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13682 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13677 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63502 e!202732))

(declare-fun e!202733 () Bool)

(declare-fun inv!12 (BitStream!12640) Bool)

(assert (=> start!63502 (and (inv!12 thiss!1939) e!202733)))

(declare-fun b!283799 () Bool)

(assert (=> b!283799 (= e!202732 false)))

(declare-datatypes ((Unit!19895 0))(
  ( (Unit!19896) )
))
(declare-datatypes ((tuple2!22614 0))(
  ( (tuple2!22615 (_1!12501 Unit!19895) (_2!12501 BitStream!12640)) )
))
(declare-fun lt!418212 () tuple2!22614)

(declare-fun alignToByte!0 (BitStream!12640) tuple2!22614)

(assert (=> b!283799 (= lt!418212 (alignToByte!0 thiss!1939))))

(declare-fun b!283800 () Bool)

(declare-fun array_inv!6828 (array!16525) Bool)

(assert (=> b!283800 (= e!202733 (array_inv!6828 (buf!7381 thiss!1939)))))

(assert (= (and start!63502 res!235178) b!283799))

(assert (= start!63502 b!283800))

(declare-fun m!416899 () Bool)

(assert (=> start!63502 m!416899))

(declare-fun m!416901 () Bool)

(assert (=> start!63502 m!416901))

(declare-fun m!416903 () Bool)

(assert (=> b!283799 m!416903))

(declare-fun m!416905 () Bool)

(assert (=> b!283800 m!416905))

(push 1)

(assert (not b!283799))

(assert (not b!283800))

(assert (not start!63502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

