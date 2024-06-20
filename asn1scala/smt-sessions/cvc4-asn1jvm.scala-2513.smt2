; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63512 () Bool)

(assert start!63512)

(declare-fun res!235193 () Bool)

(declare-fun e!202779 () Bool)

(assert (=> start!63512 (=> (not res!235193) (not e!202779))))

(declare-datatypes ((array!16535 0))(
  ( (array!16536 (arr!8136 (Array (_ BitVec 32) (_ BitVec 8))) (size!7140 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12650 0))(
  ( (BitStream!12651 (buf!7386 array!16535) (currentByte!13687 (_ BitVec 32)) (currentBit!13682 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12650)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63512 (= res!235193 (validate_offset_bits!1 ((_ sign_extend 32) (size!7140 (buf!7386 thiss!1939))) ((_ sign_extend 32) (currentByte!13687 thiss!1939)) ((_ sign_extend 32) (currentBit!13682 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13687 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13682 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63512 e!202779))

(declare-fun e!202777 () Bool)

(declare-fun inv!12 (BitStream!12650) Bool)

(assert (=> start!63512 (and (inv!12 thiss!1939) e!202777)))

(declare-fun b!283829 () Bool)

(declare-fun lt!418227 () (_ BitVec 32))

(assert (=> b!283829 (= e!202779 (and (not (= lt!418227 #b00000000000000000000000000000000)) (not (= #b00000000000000000000000000000010 (bvsdiv (bvmul #b00000000000000000000000000000010 lt!418227) lt!418227)))))))

(declare-datatypes ((Unit!19905 0))(
  ( (Unit!19906) )
))
(declare-datatypes ((tuple2!22624 0))(
  ( (tuple2!22625 (_1!12506 Unit!19905) (_2!12506 BitStream!12650)) )
))
(declare-fun alignToByte!0 (BitStream!12650) tuple2!22624)

(assert (=> b!283829 (= lt!418227 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13687 (_2!12506 (alignToByte!0 thiss!1939)))) #b00000000000000000000000000000010))))

(declare-fun b!283830 () Bool)

(declare-fun array_inv!6833 (array!16535) Bool)

(assert (=> b!283830 (= e!202777 (array_inv!6833 (buf!7386 thiss!1939)))))

(assert (= (and start!63512 res!235193) b!283829))

(assert (= start!63512 b!283830))

(declare-fun m!416939 () Bool)

(assert (=> start!63512 m!416939))

(declare-fun m!416941 () Bool)

(assert (=> start!63512 m!416941))

(declare-fun m!416943 () Bool)

(assert (=> b!283829 m!416943))

(declare-fun m!416945 () Bool)

(assert (=> b!283830 m!416945))

(push 1)

(assert (not b!283829))

(assert (not b!283830))

(assert (not start!63512))

(check-sat)

(pop 1)

(push 1)

(check-sat)

