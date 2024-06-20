; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44802 () Bool)

(assert start!44802)

(declare-fun b!214355 () Bool)

(declare-fun e!145934 () Bool)

(declare-datatypes ((array!10565 0))(
  ( (array!10566 (arr!5569 (Array (_ BitVec 32) (_ BitVec 8))) (size!4639 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8386 0))(
  ( (BitStream!8387 (buf!5174 array!10565) (currentByte!9752 (_ BitVec 32)) (currentBit!9747 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!18338 0))(
  ( (tuple2!18339 (_1!9824 BitStream!8386) (_2!9824 Bool)) )
))
(declare-fun lt!338828 () tuple2!18338)

(declare-fun lt!338833 () tuple2!18338)

(assert (=> b!214355 (= e!145934 (= (_2!9824 lt!338828) (_2!9824 lt!338833)))))

(declare-fun b!214356 () Bool)

(declare-fun e!145931 () Bool)

(declare-fun e!145928 () Bool)

(assert (=> b!214356 (= e!145931 e!145928)))

(declare-fun res!180214 () Bool)

(assert (=> b!214356 (=> res!180214 e!145928)))

(declare-datatypes ((tuple2!18340 0))(
  ( (tuple2!18341 (_1!9825 BitStream!8386) (_2!9825 (_ BitVec 64))) )
))
(declare-fun lt!338827 () tuple2!18340)

(declare-datatypes ((tuple2!18342 0))(
  ( (tuple2!18343 (_1!9826 BitStream!8386) (_2!9826 BitStream!8386)) )
))
(declare-fun lt!338835 () tuple2!18342)

(assert (=> b!214356 (= res!180214 (not (= (_1!9825 lt!338827) (_2!9826 lt!338835))))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!338849 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!18340)

(assert (=> b!214356 (= lt!338827 (readNBitsLSBFirstsLoopPure!0 (_1!9826 lt!338835) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338849))))

(declare-datatypes ((Unit!15262 0))(
  ( (Unit!15263) )
))
(declare-datatypes ((tuple2!18344 0))(
  ( (tuple2!18345 (_1!9827 Unit!15262) (_2!9827 BitStream!8386)) )
))
(declare-fun lt!338836 () tuple2!18344)

(declare-fun lt!338821 () tuple2!18344)

(declare-fun lt!338826 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!214356 (validate_offset_bits!1 ((_ sign_extend 32) (size!4639 (buf!5174 (_2!9827 lt!338836)))) ((_ sign_extend 32) (currentByte!9752 (_2!9827 lt!338821))) ((_ sign_extend 32) (currentBit!9747 (_2!9827 lt!338821))) lt!338826)))

(declare-fun lt!338848 () Unit!15262)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8386 array!10565 (_ BitVec 64)) Unit!15262)

(assert (=> b!214356 (= lt!338848 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9827 lt!338821) (buf!5174 (_2!9827 lt!338836)) lt!338826))))

(assert (=> b!214356 (= lt!338826 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!338834 () (_ BitVec 64))

(declare-fun lt!338825 () (_ BitVec 64))

(declare-fun lt!338831 () tuple2!18338)

(assert (=> b!214356 (= lt!338849 (bvor lt!338825 (ite (_2!9824 lt!338831) lt!338834 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!338844 () tuple2!18342)

(declare-fun lt!338840 () tuple2!18340)

(assert (=> b!214356 (= lt!338840 (readNBitsLSBFirstsLoopPure!0 (_1!9826 lt!338844) nBits!348 i!590 lt!338825))))

(declare-fun thiss!1204 () BitStream!8386)

(declare-fun lt!338838 () (_ BitVec 64))

(assert (=> b!214356 (validate_offset_bits!1 ((_ sign_extend 32) (size!4639 (buf!5174 (_2!9827 lt!338836)))) ((_ sign_extend 32) (currentByte!9752 thiss!1204)) ((_ sign_extend 32) (currentBit!9747 thiss!1204)) lt!338838)))

(declare-fun lt!338839 () Unit!15262)

(assert (=> b!214356 (= lt!338839 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!5174 (_2!9827 lt!338836)) lt!338838))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214356 (= lt!338825 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!338846 () Bool)

(assert (=> b!214356 (= (_2!9824 lt!338831) lt!338846)))

(declare-fun readBitPure!0 (BitStream!8386) tuple2!18338)

(assert (=> b!214356 (= lt!338831 (readBitPure!0 (_1!9826 lt!338844)))))

(declare-fun reader!0 (BitStream!8386 BitStream!8386) tuple2!18342)

(assert (=> b!214356 (= lt!338835 (reader!0 (_2!9827 lt!338821) (_2!9827 lt!338836)))))

(assert (=> b!214356 (= lt!338844 (reader!0 thiss!1204 (_2!9827 lt!338836)))))

(assert (=> b!214356 e!145934))

(declare-fun res!180208 () Bool)

(assert (=> b!214356 (=> (not res!180208) (not e!145934))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!214356 (= res!180208 (= (bitIndex!0 (size!4639 (buf!5174 (_1!9824 lt!338828))) (currentByte!9752 (_1!9824 lt!338828)) (currentBit!9747 (_1!9824 lt!338828))) (bitIndex!0 (size!4639 (buf!5174 (_1!9824 lt!338833))) (currentByte!9752 (_1!9824 lt!338833)) (currentBit!9747 (_1!9824 lt!338833)))))))

(declare-fun lt!338837 () Unit!15262)

(declare-fun lt!338822 () BitStream!8386)

(declare-fun readBitPrefixLemma!0 (BitStream!8386 BitStream!8386) Unit!15262)

(assert (=> b!214356 (= lt!338837 (readBitPrefixLemma!0 lt!338822 (_2!9827 lt!338836)))))

(assert (=> b!214356 (= lt!338833 (readBitPure!0 (BitStream!8387 (buf!5174 (_2!9827 lt!338836)) (currentByte!9752 thiss!1204) (currentBit!9747 thiss!1204))))))

(assert (=> b!214356 (= lt!338828 (readBitPure!0 lt!338822))))

(declare-fun e!145922 () Bool)

(assert (=> b!214356 e!145922))

(declare-fun res!180195 () Bool)

(assert (=> b!214356 (=> (not res!180195) (not e!145922))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!214356 (= res!180195 (invariant!0 (currentBit!9747 thiss!1204) (currentByte!9752 thiss!1204) (size!4639 (buf!5174 (_2!9827 lt!338821)))))))

(assert (=> b!214356 (= lt!338822 (BitStream!8387 (buf!5174 (_2!9827 lt!338821)) (currentByte!9752 thiss!1204) (currentBit!9747 thiss!1204)))))

(declare-fun b!214358 () Bool)

(declare-fun e!145930 () Bool)

(declare-fun e!145926 () Bool)

(assert (=> b!214358 (= e!145930 e!145926)))

(declare-fun res!180213 () Bool)

(assert (=> b!214358 (=> (not res!180213) (not e!145926))))

(declare-fun lt!338845 () tuple2!18338)

(assert (=> b!214358 (= res!180213 (and (= (_2!9824 lt!338845) lt!338846) (= (_1!9824 lt!338845) (_2!9827 lt!338821))))))

(declare-fun readerFrom!0 (BitStream!8386 (_ BitVec 32) (_ BitVec 32)) BitStream!8386)

(assert (=> b!214358 (= lt!338845 (readBitPure!0 (readerFrom!0 (_2!9827 lt!338821) (currentBit!9747 thiss!1204) (currentByte!9752 thiss!1204))))))

(declare-fun b!214359 () Bool)

(declare-fun res!180205 () Bool)

(assert (=> b!214359 (=> (not res!180205) (not e!145930))))

(declare-fun isPrefixOf!0 (BitStream!8386 BitStream!8386) Bool)

(assert (=> b!214359 (= res!180205 (isPrefixOf!0 thiss!1204 (_2!9827 lt!338821)))))

(declare-fun b!214360 () Bool)

(declare-fun lt!338843 () (_ BitVec 64))

(declare-fun e!145927 () Bool)

(declare-fun lt!338847 () BitStream!8386)

(declare-fun lt!338829 () (_ BitVec 64))

(assert (=> b!214360 (= e!145927 (and (= lt!338829 (bvsub lt!338843 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!9826 lt!338835) lt!338847)) (= (_2!9825 lt!338840) (_2!9825 lt!338827)))))))

(declare-fun b!214361 () Bool)

(declare-fun e!145935 () Bool)

(assert (=> b!214361 (= e!145928 e!145935)))

(declare-fun res!180199 () Bool)

(assert (=> b!214361 (=> res!180199 e!145935)))

(assert (=> b!214361 (= res!180199 (not (= (_1!9826 lt!338835) lt!338847)))))

(assert (=> b!214361 e!145927))

(declare-fun res!180201 () Bool)

(assert (=> b!214361 (=> (not res!180201) (not e!145927))))

(declare-fun lt!338832 () tuple2!18340)

(assert (=> b!214361 (= res!180201 (and (= (_2!9825 lt!338840) (_2!9825 lt!338832)) (= (_1!9825 lt!338840) (_1!9825 lt!338832))))))

(declare-fun lt!338823 () Unit!15262)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!15262)

(assert (=> b!214361 (= lt!338823 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9826 lt!338844) nBits!348 i!590 lt!338825))))

(assert (=> b!214361 (= lt!338832 (readNBitsLSBFirstsLoopPure!0 lt!338847 nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!338849))))

(declare-fun withMovedBitIndex!0 (BitStream!8386 (_ BitVec 64)) BitStream!8386)

(assert (=> b!214361 (= lt!338847 (withMovedBitIndex!0 (_1!9826 lt!338844) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!214362 () Bool)

(declare-fun e!145932 () Bool)

(declare-fun array_inv!4380 (array!10565) Bool)

(assert (=> b!214362 (= e!145932 (array_inv!4380 (buf!5174 thiss!1204)))))

(declare-fun b!214363 () Bool)

(declare-fun res!180194 () Bool)

(assert (=> b!214363 (=> res!180194 e!145931)))

(assert (=> b!214363 (= res!180194 (not (isPrefixOf!0 (_2!9827 lt!338821) (_2!9827 lt!338836))))))

(declare-fun b!214364 () Bool)

(declare-fun res!180209 () Bool)

(declare-fun e!145924 () Bool)

(assert (=> b!214364 (=> (not res!180209) (not e!145924))))

(assert (=> b!214364 (= res!180209 (invariant!0 (currentBit!9747 thiss!1204) (currentByte!9752 thiss!1204) (size!4639 (buf!5174 thiss!1204))))))

(declare-fun b!214365 () Bool)

(declare-fun e!145929 () Bool)

(assert (=> b!214365 (= e!145929 e!145924)))

(declare-fun res!180210 () Bool)

(assert (=> b!214365 (=> (not res!180210) (not e!145924))))

(assert (=> b!214365 (= res!180210 (validate_offset_bits!1 ((_ sign_extend 32) (size!4639 (buf!5174 thiss!1204))) ((_ sign_extend 32) (currentByte!9752 thiss!1204)) ((_ sign_extend 32) (currentBit!9747 thiss!1204)) lt!338838))))

(assert (=> b!214365 (= lt!338838 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!214366 () Bool)

(declare-fun res!180200 () Bool)

(assert (=> b!214366 (=> res!180200 e!145935)))

(assert (=> b!214366 (= res!180200 (not (= (bitIndex!0 (size!4639 (buf!5174 (_1!9825 lt!338840))) (currentByte!9752 (_1!9825 lt!338840)) (currentBit!9747 (_1!9825 lt!338840))) (bitIndex!0 (size!4639 (buf!5174 (_2!9826 lt!338844))) (currentByte!9752 (_2!9826 lt!338844)) (currentBit!9747 (_2!9826 lt!338844))))))))

(declare-fun b!214367 () Bool)

(declare-fun e!145925 () Bool)

(assert (=> b!214367 (= e!145924 (not e!145925))))

(declare-fun res!180196 () Bool)

(assert (=> b!214367 (=> res!180196 e!145925)))

(assert (=> b!214367 (= res!180196 (not (= lt!338843 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!338829))))))

(assert (=> b!214367 (= lt!338843 (bitIndex!0 (size!4639 (buf!5174 (_2!9827 lt!338821))) (currentByte!9752 (_2!9827 lt!338821)) (currentBit!9747 (_2!9827 lt!338821))))))

(assert (=> b!214367 (= lt!338829 (bitIndex!0 (size!4639 (buf!5174 thiss!1204)) (currentByte!9752 thiss!1204) (currentBit!9747 thiss!1204)))))

(declare-fun e!145923 () Bool)

(assert (=> b!214367 e!145923))

(declare-fun res!180207 () Bool)

(assert (=> b!214367 (=> (not res!180207) (not e!145923))))

(assert (=> b!214367 (= res!180207 (= (size!4639 (buf!5174 thiss!1204)) (size!4639 (buf!5174 (_2!9827 lt!338821)))))))

(declare-fun appendBit!0 (BitStream!8386 Bool) tuple2!18344)

(assert (=> b!214367 (= lt!338821 (appendBit!0 thiss!1204 lt!338846))))

(assert (=> b!214367 (= lt!338846 (not (= (bvand v!189 lt!338834) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!214367 (= lt!338834 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!214368 () Bool)

(assert (=> b!214368 (= e!145925 e!145931)))

(declare-fun res!180203 () Bool)

(assert (=> b!214368 (=> res!180203 e!145931)))

(declare-fun lt!338841 () (_ BitVec 64))

(assert (=> b!214368 (= res!180203 (not (= lt!338841 (bvsub (bvsub (bvadd lt!338843 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!214368 (= lt!338841 (bitIndex!0 (size!4639 (buf!5174 (_2!9827 lt!338836))) (currentByte!9752 (_2!9827 lt!338836)) (currentBit!9747 (_2!9827 lt!338836))))))

(assert (=> b!214368 (isPrefixOf!0 thiss!1204 (_2!9827 lt!338836))))

(declare-fun lt!338842 () Unit!15262)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8386 BitStream!8386 BitStream!8386) Unit!15262)

(assert (=> b!214368 (= lt!338842 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9827 lt!338821) (_2!9827 lt!338836)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8386 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!18344)

(assert (=> b!214368 (= lt!338836 (appendBitsLSBFirstLoopTR!0 (_2!9827 lt!338821) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!214369 () Bool)

(declare-fun res!180211 () Bool)

(assert (=> b!214369 (=> res!180211 e!145931)))

(assert (=> b!214369 (= res!180211 (not (isPrefixOf!0 thiss!1204 (_2!9827 lt!338821))))))

(declare-fun b!214370 () Bool)

(assert (=> b!214370 (= e!145922 (invariant!0 (currentBit!9747 thiss!1204) (currentByte!9752 thiss!1204) (size!4639 (buf!5174 (_2!9827 lt!338836)))))))

(declare-fun b!214371 () Bool)

(declare-fun res!180198 () Bool)

(assert (=> b!214371 (=> res!180198 e!145931)))

(assert (=> b!214371 (= res!180198 (not (invariant!0 (currentBit!9747 (_2!9827 lt!338836)) (currentByte!9752 (_2!9827 lt!338836)) (size!4639 (buf!5174 (_2!9827 lt!338836))))))))

(declare-fun b!214357 () Bool)

(assert (=> b!214357 (= e!145935 true)))

(assert (=> b!214357 (= (size!4639 (buf!5174 thiss!1204)) (size!4639 (buf!5174 (_2!9827 lt!338836))))))

(declare-fun res!180215 () Bool)

(assert (=> start!44802 (=> (not res!180215) (not e!145929))))

(assert (=> start!44802 (= res!180215 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!44802 e!145929))

(assert (=> start!44802 true))

(declare-fun inv!12 (BitStream!8386) Bool)

(assert (=> start!44802 (and (inv!12 thiss!1204) e!145932)))

(declare-fun b!214372 () Bool)

(declare-fun res!180212 () Bool)

(assert (=> b!214372 (=> (not res!180212) (not e!145927))))

(assert (=> b!214372 (= res!180212 (= (_1!9826 lt!338844) (withMovedBitIndex!0 (_2!9826 lt!338844) (bvsub lt!338829 lt!338841))))))

(declare-fun b!214373 () Bool)

(declare-fun res!180197 () Bool)

(assert (=> b!214373 (=> (not res!180197) (not e!145927))))

(assert (=> b!214373 (= res!180197 (= (_1!9826 lt!338835) (withMovedBitIndex!0 (_2!9826 lt!338835) (bvsub lt!338843 lt!338841))))))

(declare-fun b!214374 () Bool)

(declare-fun res!180206 () Bool)

(assert (=> b!214374 (=> res!180206 e!145931)))

(assert (=> b!214374 (= res!180206 (or (not (= (size!4639 (buf!5174 (_2!9827 lt!338836))) (size!4639 (buf!5174 thiss!1204)))) (not (= lt!338841 (bvsub (bvadd lt!338829 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!214375 () Bool)

(declare-fun res!180204 () Bool)

(assert (=> b!214375 (=> (not res!180204) (not e!145924))))

(assert (=> b!214375 (= res!180204 (not (= i!590 nBits!348)))))

(declare-fun b!214376 () Bool)

(assert (=> b!214376 (= e!145923 e!145930)))

(declare-fun res!180202 () Bool)

(assert (=> b!214376 (=> (not res!180202) (not e!145930))))

(declare-fun lt!338824 () (_ BitVec 64))

(declare-fun lt!338830 () (_ BitVec 64))

(assert (=> b!214376 (= res!180202 (= lt!338824 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!338830)))))

(assert (=> b!214376 (= lt!338824 (bitIndex!0 (size!4639 (buf!5174 (_2!9827 lt!338821))) (currentByte!9752 (_2!9827 lt!338821)) (currentBit!9747 (_2!9827 lt!338821))))))

(assert (=> b!214376 (= lt!338830 (bitIndex!0 (size!4639 (buf!5174 thiss!1204)) (currentByte!9752 thiss!1204) (currentBit!9747 thiss!1204)))))

(declare-fun b!214377 () Bool)

(assert (=> b!214377 (= e!145926 (= (bitIndex!0 (size!4639 (buf!5174 (_1!9824 lt!338845))) (currentByte!9752 (_1!9824 lt!338845)) (currentBit!9747 (_1!9824 lt!338845))) lt!338824))))

(assert (= (and start!44802 res!180215) b!214365))

(assert (= (and b!214365 res!180210) b!214364))

(assert (= (and b!214364 res!180209) b!214375))

(assert (= (and b!214375 res!180204) b!214367))

(assert (= (and b!214367 res!180207) b!214376))

(assert (= (and b!214376 res!180202) b!214359))

(assert (= (and b!214359 res!180205) b!214358))

(assert (= (and b!214358 res!180213) b!214377))

(assert (= (and b!214367 (not res!180196)) b!214368))

(assert (= (and b!214368 (not res!180203)) b!214371))

(assert (= (and b!214371 (not res!180198)) b!214374))

(assert (= (and b!214374 (not res!180206)) b!214363))

(assert (= (and b!214363 (not res!180194)) b!214369))

(assert (= (and b!214369 (not res!180211)) b!214356))

(assert (= (and b!214356 res!180195) b!214370))

(assert (= (and b!214356 res!180208) b!214355))

(assert (= (and b!214356 (not res!180214)) b!214361))

(assert (= (and b!214361 res!180201) b!214372))

(assert (= (and b!214372 res!180212) b!214373))

(assert (= (and b!214373 res!180197) b!214360))

(assert (= (and b!214361 (not res!180199)) b!214366))

(assert (= (and b!214366 (not res!180200)) b!214357))

(assert (= start!44802 b!214362))

(declare-fun m!330393 () Bool)

(assert (=> b!214366 m!330393))

(declare-fun m!330395 () Bool)

(assert (=> b!214366 m!330395))

(declare-fun m!330397 () Bool)

(assert (=> b!214364 m!330397))

(declare-fun m!330399 () Bool)

(assert (=> b!214365 m!330399))

(declare-fun m!330401 () Bool)

(assert (=> b!214362 m!330401))

(declare-fun m!330403 () Bool)

(assert (=> b!214377 m!330403))

(declare-fun m!330405 () Bool)

(assert (=> b!214373 m!330405))

(declare-fun m!330407 () Bool)

(assert (=> b!214370 m!330407))

(declare-fun m!330409 () Bool)

(assert (=> start!44802 m!330409))

(declare-fun m!330411 () Bool)

(assert (=> b!214356 m!330411))

(declare-fun m!330413 () Bool)

(assert (=> b!214356 m!330413))

(declare-fun m!330415 () Bool)

(assert (=> b!214356 m!330415))

(declare-fun m!330417 () Bool)

(assert (=> b!214356 m!330417))

(declare-fun m!330419 () Bool)

(assert (=> b!214356 m!330419))

(declare-fun m!330421 () Bool)

(assert (=> b!214356 m!330421))

(declare-fun m!330423 () Bool)

(assert (=> b!214356 m!330423))

(declare-fun m!330425 () Bool)

(assert (=> b!214356 m!330425))

(declare-fun m!330427 () Bool)

(assert (=> b!214356 m!330427))

(declare-fun m!330429 () Bool)

(assert (=> b!214356 m!330429))

(declare-fun m!330431 () Bool)

(assert (=> b!214356 m!330431))

(declare-fun m!330433 () Bool)

(assert (=> b!214356 m!330433))

(declare-fun m!330435 () Bool)

(assert (=> b!214356 m!330435))

(declare-fun m!330437 () Bool)

(assert (=> b!214356 m!330437))

(declare-fun m!330439 () Bool)

(assert (=> b!214356 m!330439))

(declare-fun m!330441 () Bool)

(assert (=> b!214356 m!330441))

(declare-fun m!330443 () Bool)

(assert (=> b!214368 m!330443))

(declare-fun m!330445 () Bool)

(assert (=> b!214368 m!330445))

(declare-fun m!330447 () Bool)

(assert (=> b!214368 m!330447))

(declare-fun m!330449 () Bool)

(assert (=> b!214368 m!330449))

(declare-fun m!330451 () Bool)

(assert (=> b!214361 m!330451))

(declare-fun m!330453 () Bool)

(assert (=> b!214361 m!330453))

(declare-fun m!330455 () Bool)

(assert (=> b!214361 m!330455))

(declare-fun m!330457 () Bool)

(assert (=> b!214367 m!330457))

(declare-fun m!330459 () Bool)

(assert (=> b!214367 m!330459))

(declare-fun m!330461 () Bool)

(assert (=> b!214367 m!330461))

(declare-fun m!330463 () Bool)

(assert (=> b!214372 m!330463))

(declare-fun m!330465 () Bool)

(assert (=> b!214371 m!330465))

(declare-fun m!330467 () Bool)

(assert (=> b!214359 m!330467))

(declare-fun m!330469 () Bool)

(assert (=> b!214363 m!330469))

(assert (=> b!214376 m!330457))

(assert (=> b!214376 m!330459))

(assert (=> b!214369 m!330467))

(declare-fun m!330471 () Bool)

(assert (=> b!214358 m!330471))

(assert (=> b!214358 m!330471))

(declare-fun m!330473 () Bool)

(assert (=> b!214358 m!330473))

(push 1)

(assert (not start!44802))

(assert (not b!214373))

(assert (not b!214363))

(assert (not b!214359))

(assert (not b!214364))

(assert (not b!214371))

(assert (not b!214361))

(assert (not b!214367))

(assert (not b!214365))

(assert (not b!214372))

(assert (not b!214368))

(assert (not b!214377))

(assert (not b!214366))

(assert (not b!214356))

(assert (not b!214362))

(assert (not b!214358))

(assert (not b!214376))

(assert (not b!214369))

(assert (not b!214370))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

