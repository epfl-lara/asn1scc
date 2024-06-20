; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4018 () Bool)

(assert start!4018)

(declare-fun res!15412 () Bool)

(declare-fun e!10875 () Bool)

(assert (=> start!4018 (=> (not res!15412) (not e!10875))))

(declare-fun newOffset!1 () (_ BitVec 64))

(declare-fun origOffset!1 () (_ BitVec 64))

(assert (=> start!4018 (= res!15412 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1)))))

(assert (=> start!4018 e!10875))

(assert (=> start!4018 true))

(declare-datatypes ((array!1026 0))(
  ( (array!1027 (arr!864 (Array (_ BitVec 32) (_ BitVec 8))) (size!435 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!830 0))(
  ( (BitStream!831 (buf!798 array!1026) (currentByte!1983 (_ BitVec 32)) (currentBit!1978 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!830)

(declare-fun e!10874 () Bool)

(declare-fun inv!12 (BitStream!830) Bool)

(assert (=> start!4018 (and (inv!12 b!162) e!10874)))

(declare-fun b!17148 () Bool)

(declare-fun res!15413 () Bool)

(assert (=> b!17148 (=> (not res!15413) (not e!10875))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17148 (= res!15413 (validate_offset_bits!1 ((_ sign_extend 32) (size!435 (buf!798 b!162))) ((_ sign_extend 32) (currentByte!1983 b!162)) ((_ sign_extend 32) (currentBit!1978 b!162)) origOffset!1))))

(declare-fun b!17149 () Bool)

(assert (=> b!17149 (= e!10875 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!435 (buf!798 b!162))) ((_ sign_extend 32) (currentByte!1983 b!162)) ((_ sign_extend 32) (currentBit!1978 b!162)) newOffset!1)))))

(declare-fun b!17150 () Bool)

(declare-fun array_inv!424 (array!1026) Bool)

(assert (=> b!17150 (= e!10874 (array_inv!424 (buf!798 b!162)))))

(assert (= (and start!4018 res!15412) b!17148))

(assert (= (and b!17148 res!15413) b!17149))

(assert (= start!4018 b!17150))

(declare-fun m!23327 () Bool)

(assert (=> start!4018 m!23327))

(declare-fun m!23329 () Bool)

(assert (=> b!17148 m!23329))

(declare-fun m!23331 () Bool)

(assert (=> b!17149 m!23331))

(declare-fun m!23333 () Bool)

(assert (=> b!17150 m!23333))

(push 1)

(assert (not b!17150))

(assert (not b!17149))

(assert (not start!4018))

(assert (not b!17148))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5616 () Bool)

