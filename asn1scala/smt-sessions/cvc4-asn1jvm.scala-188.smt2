; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3944 () Bool)

(assert start!3944)

(declare-fun res!15332 () Bool)

(declare-fun e!10767 () Bool)

(assert (=> start!3944 (=> (not res!15332) (not e!10767))))

(declare-fun origOffset!1 () (_ BitVec 64))

(declare-datatypes ((array!996 0))(
  ( (array!997 (arr!852 (Array (_ BitVec 32) (_ BitVec 8))) (size!423 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!806 0))(
  ( (BitStream!807 (buf!786 array!996) (currentByte!1958 (_ BitVec 32)) (currentBit!1953 (_ BitVec 32))) )
))
(declare-fun b!162 () BitStream!806)

(declare-fun newOffset!1 () (_ BitVec 64))

(assert (=> start!3944 (= res!15332 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 newOffset!1) (bvsle newOffset!1 origOffset!1) (bvsle ((_ sign_extend 32) (size!423 (buf!786 b!162))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!1958 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!1953 b!162)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!423 (buf!786 b!162))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!1958 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!1953 b!162)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!3944 e!10767))

(assert (=> start!3944 true))

(declare-fun e!10765 () Bool)

(declare-fun inv!12 (BitStream!806) Bool)

(assert (=> start!3944 (and (inv!12 b!162) e!10765)))

(declare-fun b!17031 () Bool)

(declare-fun res!15331 () Bool)

(assert (=> b!17031 (=> (not res!15331) (not e!10767))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17031 (= res!15331 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!1953 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!1958 b!162))) ((_ extract 31 0) ((_ sign_extend 32) (size!423 (buf!786 b!162))))))))

(declare-fun b!17032 () Bool)

(assert (=> b!17032 (= e!10767 (bvslt origOffset!1 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!17033 () Bool)

(declare-fun array_inv!412 (array!996) Bool)

(assert (=> b!17033 (= e!10765 (array_inv!412 (buf!786 b!162)))))

(assert (= (and start!3944 res!15332) b!17031))

(assert (= (and b!17031 res!15331) b!17032))

(assert (= start!3944 b!17033))

(declare-fun m!23223 () Bool)

(assert (=> start!3944 m!23223))

(declare-fun m!23225 () Bool)

(assert (=> b!17031 m!23225))

(declare-fun m!23227 () Bool)

(assert (=> b!17033 m!23227))

(push 1)

