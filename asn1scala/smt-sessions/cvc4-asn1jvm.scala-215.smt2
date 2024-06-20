; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4376 () Bool)

(assert start!4376)

(declare-fun b!17941 () Bool)

(declare-fun e!11483 () Bool)

(declare-fun e!11486 () Bool)

(assert (=> b!17941 (= e!11483 (not e!11486))))

(declare-fun res!15779 () Bool)

(assert (=> b!17941 (=> res!15779 e!11486)))

(declare-datatypes ((array!1191 0))(
  ( (array!1192 (arr!939 (Array (_ BitVec 32) (_ BitVec 8))) (size!504 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!878 0))(
  ( (BitStream!879 (buf!822 array!1191) (currentByte!2049 (_ BitVec 32)) (currentBit!2044 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!878)

(declare-datatypes ((tuple2!2088 0))(
  ( (tuple2!2089 (_1!1114 array!1191) (_2!1114 BitStream!878)) )
))
(declare-fun lt!25978 () tuple2!2088)

(assert (=> b!17941 (= res!15779 (not (= (currentByte!2049 thiss!1917) (size!504 (buf!822 (_2!1114 lt!25978))))))))

(declare-fun e!11485 () Bool)

(assert (=> b!17941 e!11485))

(declare-fun res!15776 () Bool)

(assert (=> b!17941 (=> (not res!15776) (not e!11485))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17941 (= res!15776 (invariant!0 (currentBit!2044 (_2!1114 lt!25978)) (currentByte!2049 (_2!1114 lt!25978)) (size!504 (buf!822 (_2!1114 lt!25978)))))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun readBits!0 (BitStream!878 (_ BitVec 64)) tuple2!2088)

(assert (=> b!17941 (= lt!25978 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!17942 () Bool)

(declare-fun res!15778 () Bool)

(assert (=> b!17942 (=> (not res!15778) (not e!11483))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17942 (= res!15778 (validate_offset_bits!1 ((_ sign_extend 32) (size!504 (buf!822 thiss!1917))) ((_ sign_extend 32) (currentByte!2049 thiss!1917)) ((_ sign_extend 32) (currentBit!2044 thiss!1917)) nBits!604))))

(declare-fun b!17943 () Bool)

(declare-fun e!11484 () Bool)

(declare-fun array_inv!474 (array!1191) Bool)

(assert (=> b!17943 (= e!11484 (array_inv!474 (buf!822 thiss!1917)))))

(declare-fun res!15777 () Bool)

(assert (=> start!4376 (=> (not res!15777) (not e!11483))))

(assert (=> start!4376 (= res!15777 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4376 e!11483))

(assert (=> start!4376 true))

(declare-fun inv!12 (BitStream!878) Bool)

(assert (=> start!4376 (and (inv!12 thiss!1917) e!11484)))

(declare-fun b!17944 () Bool)

(assert (=> b!17944 (= e!11485 (or (not (= (currentByte!2049 thiss!1917) (size!504 (buf!822 (_2!1114 lt!25978))))) (and (= (currentBit!2044 (_2!1114 lt!25978)) #b00000000000000000000000000000000) (= (currentBit!2044 thiss!1917) #b00000000000000000000000000000000))))))

(declare-fun b!17945 () Bool)

(assert (=> b!17945 (= e!11486 (invariant!0 (currentBit!2044 thiss!1917) (currentByte!2049 (_2!1114 lt!25978)) (size!504 (buf!822 (_2!1114 lt!25978)))))))

(assert (= (and start!4376 res!15777) b!17942))

(assert (= (and b!17942 res!15778) b!17941))

(assert (= (and b!17941 res!15776) b!17944))

(assert (= (and b!17941 (not res!15779)) b!17945))

(assert (= start!4376 b!17943))

(declare-fun m!24307 () Bool)

(assert (=> b!17941 m!24307))

(declare-fun m!24309 () Bool)

(assert (=> b!17941 m!24309))

(declare-fun m!24311 () Bool)

(assert (=> b!17942 m!24311))

(declare-fun m!24313 () Bool)

(assert (=> start!4376 m!24313))

(declare-fun m!24315 () Bool)

(assert (=> b!17943 m!24315))

(declare-fun m!24317 () Bool)

(assert (=> b!17945 m!24317))

(push 1)

