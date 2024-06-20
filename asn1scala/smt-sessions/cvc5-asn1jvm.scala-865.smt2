; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25044 () Bool)

(assert start!25044)

(declare-fun b!126744 () Bool)

(declare-fun e!83551 () Bool)

(assert (=> b!126744 (= e!83551 true)))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-datatypes ((array!5732 0))(
  ( (array!5733 (arr!3204 (Array (_ BitVec 32) (_ BitVec 8))) (size!2593 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4510 0))(
  ( (BitStream!4511 (buf!2978 array!5732) (currentByte!5717 (_ BitVec 32)) (currentBit!5712 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10624 0))(
  ( (tuple2!10625 (_1!5597 BitStream!4510) (_2!5597 array!5732)) )
))
(declare-fun lt!198043 () tuple2!10624)

(declare-datatypes ((tuple2!10626 0))(
  ( (tuple2!10627 (_1!5598 BitStream!4510) (_2!5598 BitStream!4510)) )
))
(declare-fun lt!198048 () tuple2!10626)

(declare-fun arr!227 () array!5732)

(declare-fun readByteArrayLoopPure!0 (BitStream!4510 array!5732 (_ BitVec 32) (_ BitVec 32)) tuple2!10624)

(assert (=> b!126744 (= lt!198043 (readByteArrayLoopPure!0 (_1!5598 lt!198048) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-datatypes ((Unit!7792 0))(
  ( (Unit!7793) )
))
(declare-datatypes ((tuple2!10628 0))(
  ( (tuple2!10629 (_1!5599 Unit!7792) (_2!5599 BitStream!4510)) )
))
(declare-fun lt!198044 () tuple2!10628)

(declare-fun thiss!1614 () BitStream!4510)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126744 (validate_offset_bits!1 ((_ sign_extend 32) (size!2593 (buf!2978 (_2!5599 lt!198044)))) ((_ sign_extend 32) (currentByte!5717 thiss!1614)) ((_ sign_extend 32) (currentBit!5712 thiss!1614)) ((_ sign_extend 32) noOfBytes!1))))

(declare-fun lt!198049 () Unit!7792)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4510 array!5732 (_ BitVec 64)) Unit!7792)

(assert (=> b!126744 (= lt!198049 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2978 (_2!5599 lt!198044)) ((_ sign_extend 32) noOfBytes!1)))))

(declare-fun reader!0 (BitStream!4510 BitStream!4510) tuple2!10626)

(assert (=> b!126744 (= lt!198048 (reader!0 thiss!1614 (_2!5599 lt!198044)))))

(declare-fun b!126745 () Bool)

(declare-fun e!83554 () Bool)

(declare-fun e!83550 () Bool)

(assert (=> b!126745 (= e!83554 e!83550)))

(declare-fun res!105046 () Bool)

(assert (=> b!126745 (=> (not res!105046) (not e!83550))))

(declare-fun lt!198050 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!126745 (= res!105046 (= (bitIndex!0 (size!2593 (buf!2978 (_2!5599 lt!198044))) (currentByte!5717 (_2!5599 lt!198044)) (currentBit!5712 (_2!5599 lt!198044))) (bvadd (bitIndex!0 (size!2593 (buf!2978 thiss!1614)) (currentByte!5717 thiss!1614) (currentBit!5712 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!198050))))))

(assert (=> b!126745 (= lt!198050 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!126746 () Bool)

(declare-fun res!105049 () Bool)

(assert (=> b!126746 (=> res!105049 e!83551)))

(declare-fun isPrefixOf!0 (BitStream!4510 BitStream!4510) Bool)

(assert (=> b!126746 (= res!105049 (not (isPrefixOf!0 thiss!1614 (_2!5599 lt!198044))))))

(declare-fun b!126747 () Bool)

(declare-fun e!83552 () Bool)

(assert (=> b!126747 (= e!83550 (not e!83552))))

(declare-fun res!105042 () Bool)

(assert (=> b!126747 (=> res!105042 e!83552)))

(declare-fun lt!198046 () tuple2!10626)

(declare-fun lt!198045 () tuple2!10624)

(assert (=> b!126747 (= res!105042 (or (not (= (size!2593 (_2!5597 lt!198045)) (size!2593 arr!227))) (not (= (_1!5597 lt!198045) (_2!5598 lt!198046)))))))

(assert (=> b!126747 (= lt!198045 (readByteArrayLoopPure!0 (_1!5598 lt!198046) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> b!126747 (validate_offset_bits!1 ((_ sign_extend 32) (size!2593 (buf!2978 (_2!5599 lt!198044)))) ((_ sign_extend 32) (currentByte!5717 thiss!1614)) ((_ sign_extend 32) (currentBit!5712 thiss!1614)) lt!198050)))

(declare-fun lt!198047 () Unit!7792)

(assert (=> b!126747 (= lt!198047 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2978 (_2!5599 lt!198044)) lt!198050))))

(assert (=> b!126747 (= lt!198046 (reader!0 thiss!1614 (_2!5599 lt!198044)))))

(declare-fun b!126748 () Bool)

(declare-fun res!105043 () Bool)

(declare-fun e!83548 () Bool)

(assert (=> b!126748 (=> (not res!105043) (not e!83548))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!126748 (= res!105043 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2593 (buf!2978 thiss!1614))) ((_ sign_extend 32) (currentByte!5717 thiss!1614)) ((_ sign_extend 32) (currentBit!5712 thiss!1614)) noOfBytes!1))))

(declare-fun b!126749 () Bool)

(declare-fun arrayRangesEq!80 (array!5732 array!5732 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!126749 (= e!83552 (not (arrayRangesEq!80 arr!227 (_2!5597 lt!198045) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!126750 () Bool)

(assert (=> b!126750 (= e!83548 (not e!83551))))

(declare-fun res!105048 () Bool)

(assert (=> b!126750 (=> res!105048 e!83551)))

(assert (=> b!126750 (= res!105048 (not (= (bitIndex!0 (size!2593 (buf!2978 (_2!5599 lt!198044))) (currentByte!5717 (_2!5599 lt!198044)) (currentBit!5712 (_2!5599 lt!198044))) (bvadd (bitIndex!0 (size!2593 (buf!2978 thiss!1614)) (currentByte!5717 thiss!1614) (currentBit!5712 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) noOfBytes!1))))))))

(assert (=> b!126750 e!83554))

(declare-fun res!105045 () Bool)

(assert (=> b!126750 (=> (not res!105045) (not e!83554))))

(assert (=> b!126750 (= res!105045 (= (size!2593 (buf!2978 thiss!1614)) (size!2593 (buf!2978 (_2!5599 lt!198044)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4510 array!5732 (_ BitVec 32) (_ BitVec 32)) tuple2!10628)

(assert (=> b!126750 (= lt!198044 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!126751 () Bool)

(declare-fun res!105044 () Bool)

(assert (=> b!126751 (=> (not res!105044) (not e!83550))))

(assert (=> b!126751 (= res!105044 (isPrefixOf!0 thiss!1614 (_2!5599 lt!198044)))))

(declare-fun res!105047 () Bool)

(assert (=> start!25044 (=> (not res!105047) (not e!83548))))

(assert (=> start!25044 (= res!105047 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2593 arr!227))))))

(assert (=> start!25044 e!83548))

(assert (=> start!25044 true))

(declare-fun array_inv!2382 (array!5732) Bool)

(assert (=> start!25044 (array_inv!2382 arr!227)))

(declare-fun e!83549 () Bool)

(declare-fun inv!12 (BitStream!4510) Bool)

(assert (=> start!25044 (and (inv!12 thiss!1614) e!83549)))

(declare-fun b!126752 () Bool)

(assert (=> b!126752 (= e!83549 (array_inv!2382 (buf!2978 thiss!1614)))))

(assert (= (and start!25044 res!105047) b!126748))

(assert (= (and b!126748 res!105043) b!126750))

(assert (= (and b!126750 res!105045) b!126745))

(assert (= (and b!126745 res!105046) b!126751))

(assert (= (and b!126751 res!105044) b!126747))

(assert (= (and b!126747 (not res!105042)) b!126749))

(assert (= (and b!126750 (not res!105048)) b!126746))

(assert (= (and b!126746 (not res!105049)) b!126744))

(assert (= start!25044 b!126752))

(declare-fun m!192321 () Bool)

(assert (=> b!126749 m!192321))

(declare-fun m!192323 () Bool)

(assert (=> b!126750 m!192323))

(declare-fun m!192325 () Bool)

(assert (=> b!126750 m!192325))

(declare-fun m!192327 () Bool)

(assert (=> b!126750 m!192327))

(declare-fun m!192329 () Bool)

(assert (=> b!126744 m!192329))

(declare-fun m!192331 () Bool)

(assert (=> b!126744 m!192331))

(declare-fun m!192333 () Bool)

(assert (=> b!126744 m!192333))

(declare-fun m!192335 () Bool)

(assert (=> b!126744 m!192335))

(declare-fun m!192337 () Bool)

(assert (=> b!126751 m!192337))

(assert (=> b!126746 m!192337))

(declare-fun m!192339 () Bool)

(assert (=> b!126748 m!192339))

(declare-fun m!192341 () Bool)

(assert (=> start!25044 m!192341))

(declare-fun m!192343 () Bool)

(assert (=> start!25044 m!192343))

(declare-fun m!192345 () Bool)

(assert (=> b!126752 m!192345))

(declare-fun m!192347 () Bool)

(assert (=> b!126747 m!192347))

(declare-fun m!192349 () Bool)

(assert (=> b!126747 m!192349))

(declare-fun m!192351 () Bool)

(assert (=> b!126747 m!192351))

(assert (=> b!126747 m!192335))

(assert (=> b!126745 m!192323))

(assert (=> b!126745 m!192325))

(push 1)

(assert (not b!126745))

(assert (not b!126747))

(assert (not start!25044))

(assert (not b!126744))

(assert (not b!126746))

(assert (not b!126752))

(assert (not b!126750))

(assert (not b!126749))

(assert (not b!126748))

(assert (not b!126751))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

