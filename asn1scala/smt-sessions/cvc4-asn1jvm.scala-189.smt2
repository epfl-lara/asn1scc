; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3950 () Bool)

(assert start!3950)

(declare-fun res!15349 () Bool)

(declare-fun e!10794 () Bool)

(assert (=> start!3950 (=> (not res!15349) (not e!10794))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!3950 (= res!15349 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!3950 e!10794))

(assert (=> start!3950 true))

(declare-datatypes ((array!1002 0))(
  ( (array!1003 (arr!855 (Array (_ BitVec 32) (_ BitVec 8))) (size!426 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!812 0))(
  ( (BitStream!813 (buf!789 array!1002) (currentByte!1961 (_ BitVec 32)) (currentBit!1956 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!812)

(declare-fun e!10792 () Bool)

(declare-fun inv!12 (BitStream!812) Bool)

(assert (=> start!3950 (and (inv!12 b!162) e!10792)))

(declare-fun b!17058 () Bool)

(declare-fun res!15350 () Bool)

(assert (=> b!17058 (=> (not res!15350) (not e!10794))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17058 (= res!15350 (validate_offset_bits!1 ((_ sign_extend 32) (size!426 (buf!789 b!162))) ((_ sign_extend 32) (currentByte!1961 b!162)) ((_ sign_extend 32) (currentBit!1956 b!162)) origOffset!1))))

(declare-fun b!17059 () Bool)

(assert (=> b!17059 (= e!10794 (or (bvsgt ((_ sign_extend 32) (size!426 (buf!789 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!1961 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!1956 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!17060 () Bool)

(declare-fun array_inv!415 (array!1002) Bool)

(assert (=> b!17060 (= e!10792 (array_inv!415 (buf!789 b!162)))))

(assert (= (and start!3950 res!15349) b!17058))

(assert (= (and b!17058 res!15350) b!17059))

(assert (= start!3950 b!17060))

(declare-fun m!23241 () Bool)

(assert (=> start!3950 m!23241))

(declare-fun m!23243 () Bool)

(assert (=> b!17058 m!23243))

(declare-fun m!23245 () Bool)

(assert (=> b!17060 m!23245))

(push 1)

(assert (not b!17058))

(assert (not start!3950))

(assert (not b!17060))

(check-sat)

(pop 1)

(push 1)

(check-sat)

