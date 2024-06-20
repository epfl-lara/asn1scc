; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18960 () Bool)

(assert start!18960)

(declare-fun b!94733 () Bool)

(declare-fun res!78038 () Bool)

(declare-fun e!62133 () Bool)

(assert (=> b!94733 (=> (not res!78038) (not e!62133))))

(declare-datatypes ((array!4429 0))(
  ( (array!4430 (arr!2624 (Array (_ BitVec 32) (_ BitVec 8))) (size!2016 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3536 0))(
  ( (BitStream!3537 (buf!2377 array!4429) (currentByte!4740 (_ BitVec 32)) (currentBit!4735 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3536)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!94733 (= res!78038 (validate_offset_bits!1 ((_ sign_extend 32) (size!2016 (buf!2377 bitStream1!8))) ((_ sign_extend 32) (currentByte!4740 bitStream1!8)) ((_ sign_extend 32) (currentBit!4735 bitStream1!8)) nBits!484))))

(declare-fun b!94734 () Bool)

(declare-fun e!62131 () Bool)

(declare-fun array_inv!1833 (array!4429) Bool)

(assert (=> b!94734 (= e!62131 (array_inv!1833 (buf!2377 bitStream1!8)))))

(declare-fun b!94735 () Bool)

(declare-fun res!78039 () Bool)

(assert (=> b!94735 (=> (not res!78039) (not e!62133))))

(declare-fun bitStream2!8 () BitStream!3536)

(declare-fun base!8 () BitStream!3536)

(assert (=> b!94735 (= res!78039 (and (= (buf!2377 bitStream1!8) (buf!2377 bitStream2!8)) (= (buf!2377 bitStream1!8) (buf!2377 base!8))))))

(declare-fun b!94736 () Bool)

(assert (=> b!94736 (= e!62133 false)))

(declare-datatypes ((tuple2!7664 0))(
  ( (tuple2!7665 (_1!4079 BitStream!3536) (_2!4079 Bool)) )
))
(declare-fun lt!138849 () tuple2!7664)

(declare-fun readBitPure!0 (BitStream!3536) tuple2!7664)

(assert (=> b!94736 (= lt!138849 (readBitPure!0 bitStream1!8))))

(declare-fun b!94737 () Bool)

(declare-fun res!78036 () Bool)

(assert (=> b!94737 (=> (not res!78036) (not e!62133))))

(declare-datatypes ((List!874 0))(
  ( (Nil!871) (Cons!870 (h!989 Bool) (t!1624 List!874)) )
))
(declare-fun listBits!13 () List!874)

(declare-fun thiss!1534 () BitStream!3536)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3536 BitStream!3536 (_ BitVec 64)) List!874)

(assert (=> b!94737 (= res!78036 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!94738 () Bool)

(declare-fun e!62127 () Bool)

(assert (=> b!94738 (= e!62127 (array_inv!1833 (buf!2377 base!8)))))

(declare-fun b!94739 () Bool)

(declare-fun res!78041 () Bool)

(assert (=> b!94739 (=> (not res!78041) (not e!62133))))

(assert (=> b!94739 (= res!78041 (not (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94740 () Bool)

(declare-fun res!78040 () Bool)

(assert (=> b!94740 (=> (not res!78040) (not e!62133))))

(assert (=> b!94740 (= res!78040 (validate_offset_bits!1 ((_ sign_extend 32) (size!2016 (buf!2377 bitStream2!8))) ((_ sign_extend 32) (currentByte!4740 bitStream2!8)) ((_ sign_extend 32) (currentBit!4735 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!94741 () Bool)

(declare-fun e!62129 () Bool)

(assert (=> b!94741 (= e!62129 (array_inv!1833 (buf!2377 bitStream2!8)))))

(declare-fun res!78035 () Bool)

(assert (=> start!18960 (=> (not res!78035) (not e!62133))))

(assert (=> start!18960 (= res!78035 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18960 e!62133))

(assert (=> start!18960 true))

(declare-fun inv!12 (BitStream!3536) Bool)

(assert (=> start!18960 (and (inv!12 bitStream1!8) e!62131)))

(assert (=> start!18960 (and (inv!12 bitStream2!8) e!62129)))

(assert (=> start!18960 (and (inv!12 base!8) e!62127)))

(declare-fun e!62126 () Bool)

(assert (=> start!18960 (and (inv!12 thiss!1534) e!62126)))

(declare-fun b!94742 () Bool)

(assert (=> b!94742 (= e!62126 (array_inv!1833 (buf!2377 thiss!1534)))))

(declare-fun b!94743 () Bool)

(declare-fun res!78031 () Bool)

(assert (=> b!94743 (=> (not res!78031) (not e!62133))))

(declare-fun length!465 (List!874) Int)

(assert (=> b!94743 (= res!78031 (> (length!465 listBits!13) 0))))

(declare-fun b!94744 () Bool)

(declare-fun res!78032 () Bool)

(assert (=> b!94744 (=> (not res!78032) (not e!62133))))

(declare-fun isPrefixOf!0 (BitStream!3536 BitStream!3536) Bool)

(assert (=> b!94744 (= res!78032 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!94745 () Bool)

(declare-fun res!78033 () Bool)

(assert (=> b!94745 (=> (not res!78033) (not e!62133))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!94745 (= res!78033 (bvslt (bitIndex!0 (size!2016 (buf!2377 base!8)) (currentByte!4740 base!8) (currentBit!4735 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!94746 () Bool)

(declare-fun res!78042 () Bool)

(assert (=> b!94746 (=> (not res!78042) (not e!62133))))

(assert (=> b!94746 (= res!78042 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2016 (buf!2377 bitStream1!8)) (currentByte!4740 bitStream1!8) (currentBit!4735 bitStream1!8))) (bitIndex!0 (size!2016 (buf!2377 bitStream2!8)) (currentByte!4740 bitStream2!8) (currentBit!4735 bitStream2!8))))))

(declare-fun b!94747 () Bool)

(declare-fun res!78034 () Bool)

(assert (=> b!94747 (=> (not res!78034) (not e!62133))))

(assert (=> b!94747 (= res!78034 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!94748 () Bool)

(declare-fun res!78037 () Bool)

(assert (=> b!94748 (=> (not res!78037) (not e!62133))))

(assert (=> b!94748 (= res!78037 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(assert (= (and start!18960 res!78035) b!94743))

(assert (= (and b!94743 res!78031) b!94747))

(assert (= (and b!94747 res!78034) b!94744))

(assert (= (and b!94744 res!78032) b!94748))

(assert (= (and b!94748 res!78037) b!94735))

(assert (= (and b!94735 res!78039) b!94745))

(assert (= (and b!94745 res!78033) b!94746))

(assert (= (and b!94746 res!78042) b!94733))

(assert (= (and b!94733 res!78038) b!94740))

(assert (= (and b!94740 res!78040) b!94737))

(assert (= (and b!94737 res!78036) b!94739))

(assert (= (and b!94739 res!78041) b!94736))

(assert (= start!18960 b!94734))

(assert (= start!18960 b!94741))

(assert (= start!18960 b!94738))

(assert (= start!18960 b!94742))

(declare-fun m!138267 () Bool)

(assert (=> b!94747 m!138267))

(declare-fun m!138269 () Bool)

(assert (=> b!94734 m!138269))

(declare-fun m!138271 () Bool)

(assert (=> b!94736 m!138271))

(declare-fun m!138273 () Bool)

(assert (=> b!94741 m!138273))

(declare-fun m!138275 () Bool)

(assert (=> b!94748 m!138275))

(declare-fun m!138277 () Bool)

(assert (=> start!18960 m!138277))

(declare-fun m!138279 () Bool)

(assert (=> start!18960 m!138279))

(declare-fun m!138281 () Bool)

(assert (=> start!18960 m!138281))

(declare-fun m!138283 () Bool)

(assert (=> start!18960 m!138283))

(declare-fun m!138285 () Bool)

(assert (=> b!94737 m!138285))

(declare-fun m!138287 () Bool)

(assert (=> b!94744 m!138287))

(declare-fun m!138289 () Bool)

(assert (=> b!94742 m!138289))

(declare-fun m!138291 () Bool)

(assert (=> b!94738 m!138291))

(declare-fun m!138293 () Bool)

(assert (=> b!94733 m!138293))

(declare-fun m!138295 () Bool)

(assert (=> b!94745 m!138295))

(declare-fun m!138297 () Bool)

(assert (=> b!94740 m!138297))

(declare-fun m!138299 () Bool)

(assert (=> b!94743 m!138299))

(declare-fun m!138301 () Bool)

(assert (=> b!94746 m!138301))

(declare-fun m!138303 () Bool)

(assert (=> b!94746 m!138303))

(push 1)

(assert (not b!94737))

(assert (not b!94746))

(assert (not b!94742))

