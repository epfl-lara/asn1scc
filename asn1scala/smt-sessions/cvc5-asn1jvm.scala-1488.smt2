; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41258 () Bool)

(assert start!41258)

(declare-fun b!191626 () Bool)

(declare-fun e!132095 () Bool)

(declare-fun e!132101 () Bool)

(assert (=> b!191626 (= e!132095 e!132101)))

(declare-fun res!159933 () Bool)

(assert (=> b!191626 (=> res!159933 e!132101)))

(declare-fun lt!298196 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!298188 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!191626 (= res!159933 (not (= lt!298196 (bvsub (bvsub (bvadd lt!298188 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-datatypes ((array!9932 0))(
  ( (array!9933 (arr!5308 (Array (_ BitVec 32) (_ BitVec 8))) (size!4378 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7864 0))(
  ( (BitStream!7865 (buf!4858 array!9932) (currentByte!9142 (_ BitVec 32)) (currentBit!9137 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13633 0))(
  ( (Unit!13634) )
))
(declare-datatypes ((tuple2!16556 0))(
  ( (tuple2!16557 (_1!8923 Unit!13633) (_2!8923 BitStream!7864)) )
))
(declare-fun lt!298190 () tuple2!16556)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!191626 (= lt!298196 (bitIndex!0 (size!4378 (buf!4858 (_2!8923 lt!298190))) (currentByte!9142 (_2!8923 lt!298190)) (currentBit!9137 (_2!8923 lt!298190))))))

(declare-fun thiss!1204 () BitStream!7864)

(declare-fun isPrefixOf!0 (BitStream!7864 BitStream!7864) Bool)

(assert (=> b!191626 (isPrefixOf!0 thiss!1204 (_2!8923 lt!298190))))

(declare-fun lt!298189 () tuple2!16556)

(declare-fun lt!298214 () Unit!13633)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7864 BitStream!7864 BitStream!7864) Unit!13633)

(assert (=> b!191626 (= lt!298214 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8923 lt!298189) (_2!8923 lt!298190)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7864 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16556)

(assert (=> b!191626 (= lt!298190 (appendBitsLSBFirstLoopTR!0 (_2!8923 lt!298189) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!191627 () Bool)

(declare-fun e!132106 () Bool)

(declare-fun array_inv!4119 (array!9932) Bool)

(assert (=> b!191627 (= e!132106 (array_inv!4119 (buf!4858 thiss!1204)))))

(declare-fun b!191628 () Bool)

(declare-fun e!132107 () Bool)

(assert (=> b!191628 (= e!132101 e!132107)))

(declare-fun res!159943 () Bool)

(assert (=> b!191628 (=> res!159943 e!132107)))

(declare-datatypes ((tuple2!16558 0))(
  ( (tuple2!16559 (_1!8924 BitStream!7864) (_2!8924 (_ BitVec 64))) )
))
(declare-fun lt!298204 () tuple2!16558)

(declare-datatypes ((tuple2!16560 0))(
  ( (tuple2!16561 (_1!8925 BitStream!7864) (_2!8925 BitStream!7864)) )
))
(declare-fun lt!298206 () tuple2!16560)

(assert (=> b!191628 (= res!159943 (not (= (_1!8924 lt!298204) (_2!8925 lt!298206))))))

(declare-fun lt!298207 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16558)

(assert (=> b!191628 (= lt!298204 (readNBitsLSBFirstsLoopPure!0 (_1!8925 lt!298206) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298207))))

(declare-fun lt!298195 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!191628 (validate_offset_bits!1 ((_ sign_extend 32) (size!4378 (buf!4858 (_2!8923 lt!298190)))) ((_ sign_extend 32) (currentByte!9142 (_2!8923 lt!298189))) ((_ sign_extend 32) (currentBit!9137 (_2!8923 lt!298189))) lt!298195)))

(declare-fun lt!298197 () Unit!13633)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7864 array!9932 (_ BitVec 64)) Unit!13633)

(assert (=> b!191628 (= lt!298197 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8923 lt!298189) (buf!4858 (_2!8923 lt!298190)) lt!298195))))

(assert (=> b!191628 (= lt!298195 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!16562 0))(
  ( (tuple2!16563 (_1!8926 BitStream!7864) (_2!8926 Bool)) )
))
(declare-fun lt!298194 () tuple2!16562)

(declare-fun lt!298199 () (_ BitVec 64))

(declare-fun lt!298192 () (_ BitVec 64))

(assert (=> b!191628 (= lt!298207 (bvor lt!298199 (ite (_2!8926 lt!298194) lt!298192 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!298198 () tuple2!16560)

(declare-fun lt!298210 () tuple2!16558)

(assert (=> b!191628 (= lt!298210 (readNBitsLSBFirstsLoopPure!0 (_1!8925 lt!298198) nBits!348 i!590 lt!298199))))

(declare-fun lt!298215 () (_ BitVec 64))

(assert (=> b!191628 (validate_offset_bits!1 ((_ sign_extend 32) (size!4378 (buf!4858 (_2!8923 lt!298190)))) ((_ sign_extend 32) (currentByte!9142 thiss!1204)) ((_ sign_extend 32) (currentBit!9137 thiss!1204)) lt!298215)))

(declare-fun lt!298203 () Unit!13633)

(assert (=> b!191628 (= lt!298203 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4858 (_2!8923 lt!298190)) lt!298215))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!191628 (= lt!298199 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!298208 () Bool)

(assert (=> b!191628 (= (_2!8926 lt!298194) lt!298208)))

(declare-fun readBitPure!0 (BitStream!7864) tuple2!16562)

(assert (=> b!191628 (= lt!298194 (readBitPure!0 (_1!8925 lt!298198)))))

(declare-fun reader!0 (BitStream!7864 BitStream!7864) tuple2!16560)

(assert (=> b!191628 (= lt!298206 (reader!0 (_2!8923 lt!298189) (_2!8923 lt!298190)))))

(assert (=> b!191628 (= lt!298198 (reader!0 thiss!1204 (_2!8923 lt!298190)))))

(declare-fun e!132094 () Bool)

(assert (=> b!191628 e!132094))

(declare-fun res!159938 () Bool)

(assert (=> b!191628 (=> (not res!159938) (not e!132094))))

(declare-fun lt!298205 () tuple2!16562)

(declare-fun lt!298193 () tuple2!16562)

(assert (=> b!191628 (= res!159938 (= (bitIndex!0 (size!4378 (buf!4858 (_1!8926 lt!298205))) (currentByte!9142 (_1!8926 lt!298205)) (currentBit!9137 (_1!8926 lt!298205))) (bitIndex!0 (size!4378 (buf!4858 (_1!8926 lt!298193))) (currentByte!9142 (_1!8926 lt!298193)) (currentBit!9137 (_1!8926 lt!298193)))))))

(declare-fun lt!298200 () Unit!13633)

(declare-fun lt!298213 () BitStream!7864)

(declare-fun readBitPrefixLemma!0 (BitStream!7864 BitStream!7864) Unit!13633)

(assert (=> b!191628 (= lt!298200 (readBitPrefixLemma!0 lt!298213 (_2!8923 lt!298190)))))

(assert (=> b!191628 (= lt!298193 (readBitPure!0 (BitStream!7865 (buf!4858 (_2!8923 lt!298190)) (currentByte!9142 thiss!1204) (currentBit!9137 thiss!1204))))))

(assert (=> b!191628 (= lt!298205 (readBitPure!0 lt!298213))))

(declare-fun e!132105 () Bool)

(assert (=> b!191628 e!132105))

(declare-fun res!159936 () Bool)

(assert (=> b!191628 (=> (not res!159936) (not e!132105))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!191628 (= res!159936 (invariant!0 (currentBit!9137 thiss!1204) (currentByte!9142 thiss!1204) (size!4378 (buf!4858 (_2!8923 lt!298189)))))))

(assert (=> b!191628 (= lt!298213 (BitStream!7865 (buf!4858 (_2!8923 lt!298189)) (currentByte!9142 thiss!1204) (currentBit!9137 thiss!1204)))))

(declare-fun b!191629 () Bool)

(declare-fun e!132097 () Bool)

(declare-fun e!132099 () Bool)

(assert (=> b!191629 (= e!132097 e!132099)))

(declare-fun res!159940 () Bool)

(assert (=> b!191629 (=> (not res!159940) (not e!132099))))

(declare-fun lt!298209 () (_ BitVec 64))

(declare-fun lt!298216 () (_ BitVec 64))

(assert (=> b!191629 (= res!159940 (= lt!298209 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298216)))))

(assert (=> b!191629 (= lt!298209 (bitIndex!0 (size!4378 (buf!4858 (_2!8923 lt!298189))) (currentByte!9142 (_2!8923 lt!298189)) (currentBit!9137 (_2!8923 lt!298189))))))

(assert (=> b!191629 (= lt!298216 (bitIndex!0 (size!4378 (buf!4858 thiss!1204)) (currentByte!9142 thiss!1204) (currentBit!9137 thiss!1204)))))

(declare-fun b!191630 () Bool)

(declare-fun res!159939 () Bool)

(assert (=> b!191630 (=> res!159939 e!132101)))

(assert (=> b!191630 (= res!159939 (not (invariant!0 (currentBit!9137 (_2!8923 lt!298190)) (currentByte!9142 (_2!8923 lt!298190)) (size!4378 (buf!4858 (_2!8923 lt!298190))))))))

(declare-fun b!191631 () Bool)

(declare-fun res!159954 () Bool)

(assert (=> b!191631 (=> res!159954 e!132101)))

(assert (=> b!191631 (= res!159954 (not (isPrefixOf!0 thiss!1204 (_2!8923 lt!298189))))))

(declare-fun b!191632 () Bool)

(declare-fun e!132104 () Bool)

(assert (=> b!191632 (= e!132104 (not e!132095))))

(declare-fun res!159948 () Bool)

(assert (=> b!191632 (=> res!159948 e!132095)))

(declare-fun lt!298211 () (_ BitVec 64))

(assert (=> b!191632 (= res!159948 (not (= lt!298188 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!298211))))))

(assert (=> b!191632 (= lt!298188 (bitIndex!0 (size!4378 (buf!4858 (_2!8923 lt!298189))) (currentByte!9142 (_2!8923 lt!298189)) (currentBit!9137 (_2!8923 lt!298189))))))

(assert (=> b!191632 (= lt!298211 (bitIndex!0 (size!4378 (buf!4858 thiss!1204)) (currentByte!9142 thiss!1204) (currentBit!9137 thiss!1204)))))

(assert (=> b!191632 e!132097))

(declare-fun res!159950 () Bool)

(assert (=> b!191632 (=> (not res!159950) (not e!132097))))

(assert (=> b!191632 (= res!159950 (= (size!4378 (buf!4858 thiss!1204)) (size!4378 (buf!4858 (_2!8923 lt!298189)))))))

(declare-fun appendBit!0 (BitStream!7864 Bool) tuple2!16556)

(assert (=> b!191632 (= lt!298189 (appendBit!0 thiss!1204 lt!298208))))

(assert (=> b!191632 (= lt!298208 (not (= (bvand v!189 lt!298192) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!191632 (= lt!298192 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!191633 () Bool)

(declare-fun res!159934 () Bool)

(assert (=> b!191633 (=> res!159934 e!132101)))

(assert (=> b!191633 (= res!159934 (not (isPrefixOf!0 (_2!8923 lt!298189) (_2!8923 lt!298190))))))

(declare-fun b!191634 () Bool)

(declare-fun e!132100 () Bool)

(assert (=> b!191634 (= e!132100 e!132104)))

(declare-fun res!159944 () Bool)

(assert (=> b!191634 (=> (not res!159944) (not e!132104))))

(assert (=> b!191634 (= res!159944 (validate_offset_bits!1 ((_ sign_extend 32) (size!4378 (buf!4858 thiss!1204))) ((_ sign_extend 32) (currentByte!9142 thiss!1204)) ((_ sign_extend 32) (currentBit!9137 thiss!1204)) lt!298215))))

(assert (=> b!191634 (= lt!298215 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!191635 () Bool)

(declare-fun res!159949 () Bool)

(assert (=> b!191635 (=> (not res!159949) (not e!132099))))

(assert (=> b!191635 (= res!159949 (isPrefixOf!0 thiss!1204 (_2!8923 lt!298189)))))

(declare-fun res!159945 () Bool)

(assert (=> start!41258 (=> (not res!159945) (not e!132100))))

(assert (=> start!41258 (= res!159945 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41258 e!132100))

(assert (=> start!41258 true))

(declare-fun inv!12 (BitStream!7864) Bool)

(assert (=> start!41258 (and (inv!12 thiss!1204) e!132106)))

(declare-fun b!191636 () Bool)

(declare-fun e!132103 () Bool)

(declare-fun lt!298201 () tuple2!16562)

(assert (=> b!191636 (= e!132103 (= (bitIndex!0 (size!4378 (buf!4858 (_1!8926 lt!298201))) (currentByte!9142 (_1!8926 lt!298201)) (currentBit!9137 (_1!8926 lt!298201))) lt!298209))))

(declare-fun b!191637 () Bool)

(declare-fun res!159946 () Bool)

(declare-fun e!132096 () Bool)

(assert (=> b!191637 (=> res!159946 e!132096)))

(assert (=> b!191637 (= res!159946 (not (= (bitIndex!0 (size!4378 (buf!4858 (_1!8924 lt!298210))) (currentByte!9142 (_1!8924 lt!298210)) (currentBit!9137 (_1!8924 lt!298210))) (bitIndex!0 (size!4378 (buf!4858 (_2!8925 lt!298198))) (currentByte!9142 (_2!8925 lt!298198)) (currentBit!9137 (_2!8925 lt!298198))))))))

(declare-fun b!191638 () Bool)

(assert (=> b!191638 (= e!132094 (= (_2!8926 lt!298205) (_2!8926 lt!298193)))))

(declare-fun e!132102 () Bool)

(declare-fun b!191639 () Bool)

(declare-fun lt!298191 () BitStream!7864)

(assert (=> b!191639 (= e!132102 (and (= lt!298211 (bvsub lt!298188 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!8925 lt!298206) lt!298191)) (= (_2!8924 lt!298210) (_2!8924 lt!298204)))))))

(declare-fun b!191640 () Bool)

(assert (=> b!191640 (= e!132105 (invariant!0 (currentBit!9137 thiss!1204) (currentByte!9142 thiss!1204) (size!4378 (buf!4858 (_2!8923 lt!298190)))))))

(declare-fun b!191641 () Bool)

(declare-fun res!159951 () Bool)

(assert (=> b!191641 (=> (not res!159951) (not e!132104))))

(assert (=> b!191641 (= res!159951 (not (= i!590 nBits!348)))))

(declare-fun b!191642 () Bool)

(assert (=> b!191642 (= e!132096 true)))

(assert (=> b!191642 (= (size!4378 (buf!4858 thiss!1204)) (size!4378 (buf!4858 (_2!8923 lt!298190))))))

(declare-fun b!191643 () Bool)

(declare-fun res!159941 () Bool)

(assert (=> b!191643 (=> (not res!159941) (not e!132102))))

(declare-fun withMovedBitIndex!0 (BitStream!7864 (_ BitVec 64)) BitStream!7864)

(assert (=> b!191643 (= res!159941 (= (_1!8925 lt!298206) (withMovedBitIndex!0 (_2!8925 lt!298206) (bvsub lt!298188 lt!298196))))))

(declare-fun b!191644 () Bool)

(declare-fun res!159952 () Bool)

(assert (=> b!191644 (=> res!159952 e!132101)))

(assert (=> b!191644 (= res!159952 (or (not (= (size!4378 (buf!4858 (_2!8923 lt!298190))) (size!4378 (buf!4858 thiss!1204)))) (not (= lt!298196 (bvsub (bvadd lt!298211 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!191645 () Bool)

(declare-fun res!159947 () Bool)

(assert (=> b!191645 (=> (not res!159947) (not e!132102))))

(assert (=> b!191645 (= res!159947 (= (_1!8925 lt!298198) (withMovedBitIndex!0 (_2!8925 lt!298198) (bvsub lt!298211 lt!298196))))))

(declare-fun b!191646 () Bool)

(declare-fun res!159937 () Bool)

(assert (=> b!191646 (=> (not res!159937) (not e!132104))))

(assert (=> b!191646 (= res!159937 (invariant!0 (currentBit!9137 thiss!1204) (currentByte!9142 thiss!1204) (size!4378 (buf!4858 thiss!1204))))))

(declare-fun b!191647 () Bool)

(assert (=> b!191647 (= e!132099 e!132103)))

(declare-fun res!159942 () Bool)

(assert (=> b!191647 (=> (not res!159942) (not e!132103))))

(assert (=> b!191647 (= res!159942 (and (= (_2!8926 lt!298201) lt!298208) (= (_1!8926 lt!298201) (_2!8923 lt!298189))))))

(declare-fun readerFrom!0 (BitStream!7864 (_ BitVec 32) (_ BitVec 32)) BitStream!7864)

(assert (=> b!191647 (= lt!298201 (readBitPure!0 (readerFrom!0 (_2!8923 lt!298189) (currentBit!9137 thiss!1204) (currentByte!9142 thiss!1204))))))

(declare-fun b!191648 () Bool)

(assert (=> b!191648 (= e!132107 e!132096)))

(declare-fun res!159935 () Bool)

(assert (=> b!191648 (=> res!159935 e!132096)))

(assert (=> b!191648 (= res!159935 (not (= (_1!8925 lt!298206) lt!298191)))))

(assert (=> b!191648 e!132102))

(declare-fun res!159953 () Bool)

(assert (=> b!191648 (=> (not res!159953) (not e!132102))))

(declare-fun lt!298202 () tuple2!16558)

(assert (=> b!191648 (= res!159953 (and (= (_2!8924 lt!298210) (_2!8924 lt!298202)) (= (_1!8924 lt!298210) (_1!8924 lt!298202))))))

(declare-fun lt!298212 () Unit!13633)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13633)

(assert (=> b!191648 (= lt!298212 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8925 lt!298198) nBits!348 i!590 lt!298199))))

(assert (=> b!191648 (= lt!298202 (readNBitsLSBFirstsLoopPure!0 lt!298191 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!298207))))

(assert (=> b!191648 (= lt!298191 (withMovedBitIndex!0 (_1!8925 lt!298198) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and start!41258 res!159945) b!191634))

(assert (= (and b!191634 res!159944) b!191646))

(assert (= (and b!191646 res!159937) b!191641))

(assert (= (and b!191641 res!159951) b!191632))

(assert (= (and b!191632 res!159950) b!191629))

(assert (= (and b!191629 res!159940) b!191635))

(assert (= (and b!191635 res!159949) b!191647))

(assert (= (and b!191647 res!159942) b!191636))

(assert (= (and b!191632 (not res!159948)) b!191626))

(assert (= (and b!191626 (not res!159933)) b!191630))

(assert (= (and b!191630 (not res!159939)) b!191644))

(assert (= (and b!191644 (not res!159952)) b!191633))

(assert (= (and b!191633 (not res!159934)) b!191631))

(assert (= (and b!191631 (not res!159954)) b!191628))

(assert (= (and b!191628 res!159936) b!191640))

(assert (= (and b!191628 res!159938) b!191638))

(assert (= (and b!191628 (not res!159943)) b!191648))

(assert (= (and b!191648 res!159953) b!191645))

(assert (= (and b!191645 res!159947) b!191643))

(assert (= (and b!191643 res!159941) b!191639))

(assert (= (and b!191648 (not res!159935)) b!191637))

(assert (= (and b!191637 (not res!159946)) b!191642))

(assert (= start!41258 b!191627))

(declare-fun m!297689 () Bool)

(assert (=> b!191636 m!297689))

(declare-fun m!297691 () Bool)

(assert (=> b!191631 m!297691))

(declare-fun m!297693 () Bool)

(assert (=> b!191640 m!297693))

(declare-fun m!297695 () Bool)

(assert (=> b!191648 m!297695))

(declare-fun m!297697 () Bool)

(assert (=> b!191648 m!297697))

(declare-fun m!297699 () Bool)

(assert (=> b!191648 m!297699))

(declare-fun m!297701 () Bool)

(assert (=> b!191634 m!297701))

(declare-fun m!297703 () Bool)

(assert (=> b!191645 m!297703))

(declare-fun m!297705 () Bool)

(assert (=> start!41258 m!297705))

(declare-fun m!297707 () Bool)

(assert (=> b!191630 m!297707))

(declare-fun m!297709 () Bool)

(assert (=> b!191633 m!297709))

(declare-fun m!297711 () Bool)

(assert (=> b!191647 m!297711))

(assert (=> b!191647 m!297711))

(declare-fun m!297713 () Bool)

(assert (=> b!191647 m!297713))

(declare-fun m!297715 () Bool)

(assert (=> b!191628 m!297715))

(declare-fun m!297717 () Bool)

(assert (=> b!191628 m!297717))

(declare-fun m!297719 () Bool)

(assert (=> b!191628 m!297719))

(declare-fun m!297721 () Bool)

(assert (=> b!191628 m!297721))

(declare-fun m!297723 () Bool)

(assert (=> b!191628 m!297723))

(declare-fun m!297725 () Bool)

(assert (=> b!191628 m!297725))

(declare-fun m!297727 () Bool)

(assert (=> b!191628 m!297727))

(declare-fun m!297729 () Bool)

(assert (=> b!191628 m!297729))

(declare-fun m!297731 () Bool)

(assert (=> b!191628 m!297731))

(declare-fun m!297733 () Bool)

(assert (=> b!191628 m!297733))

(declare-fun m!297735 () Bool)

(assert (=> b!191628 m!297735))

(declare-fun m!297737 () Bool)

(assert (=> b!191628 m!297737))

(declare-fun m!297739 () Bool)

(assert (=> b!191628 m!297739))

(declare-fun m!297741 () Bool)

(assert (=> b!191628 m!297741))

(declare-fun m!297743 () Bool)

(assert (=> b!191628 m!297743))

(declare-fun m!297745 () Bool)

(assert (=> b!191628 m!297745))

(declare-fun m!297747 () Bool)

(assert (=> b!191646 m!297747))

(declare-fun m!297749 () Bool)

(assert (=> b!191629 m!297749))

(declare-fun m!297751 () Bool)

(assert (=> b!191629 m!297751))

(declare-fun m!297753 () Bool)

(assert (=> b!191626 m!297753))

(declare-fun m!297755 () Bool)

(assert (=> b!191626 m!297755))

(declare-fun m!297757 () Bool)

(assert (=> b!191626 m!297757))

(declare-fun m!297759 () Bool)

(assert (=> b!191626 m!297759))

(declare-fun m!297761 () Bool)

(assert (=> b!191627 m!297761))

(declare-fun m!297763 () Bool)

(assert (=> b!191637 m!297763))

(declare-fun m!297765 () Bool)

(assert (=> b!191637 m!297765))

(declare-fun m!297767 () Bool)

(assert (=> b!191643 m!297767))

(assert (=> b!191632 m!297749))

(assert (=> b!191632 m!297751))

(declare-fun m!297769 () Bool)

(assert (=> b!191632 m!297769))

(assert (=> b!191635 m!297691))

(push 1)

(assert (not b!191635))

(assert (not b!191643))

(assert (not b!191637))

(assert (not b!191627))

(assert (not b!191648))

(assert (not b!191640))

(assert (not b!191632))

(assert (not b!191631))

(assert (not b!191629))

(assert (not b!191634))

(assert (not b!191626))

(assert (not b!191628))

(assert (not b!191636))

(assert (not start!41258))

(assert (not b!191647))

(assert (not b!191646))

(assert (not b!191633))

(assert (not b!191645))

(assert (not b!191630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

