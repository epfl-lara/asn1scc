; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15074 () Bool)

(assert start!15074)

(declare-fun res!63849 () Bool)

(declare-fun e!50686 () Bool)

(assert (=> start!15074 (=> (not res!63849) (not e!50686))))

(declare-fun nBits!322 () (_ BitVec 64))

(assert (=> start!15074 (= res!63849 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!15074 e!50686))

(assert (=> start!15074 true))

(declare-datatypes ((array!3236 0))(
  ( (array!3237 (arr!2106 (Array (_ BitVec 32) (_ BitVec 8))) (size!1505 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2584 0))(
  ( (BitStream!2585 (buf!1895 array!3236) (currentByte!3706 (_ BitVec 32)) (currentBit!3701 (_ BitVec 32))) )
))
(declare-fun thiss!1090 () BitStream!2584)

(declare-fun e!50685 () Bool)

(declare-fun inv!12 (BitStream!2584) Bool)

(assert (=> start!15074 (and (inv!12 thiss!1090) e!50685)))

(declare-fun b!77269 () Bool)

(declare-fun res!63847 () Bool)

(declare-fun e!50688 () Bool)

(assert (=> b!77269 (=> (not res!63847) (not e!50688))))

(declare-datatypes ((Unit!5101 0))(
  ( (Unit!5102) )
))
(declare-datatypes ((tuple2!6812 0))(
  ( (tuple2!6813 (_1!3540 Unit!5101) (_2!3540 BitStream!2584)) )
))
(declare-fun lt!123772 () tuple2!6812)

(declare-fun isPrefixOf!0 (BitStream!2584 BitStream!2584) Bool)

(assert (=> b!77269 (= res!63847 (isPrefixOf!0 thiss!1090 (_2!3540 lt!123772)))))

(declare-fun b!77270 () Bool)

(declare-datatypes ((tuple2!6814 0))(
  ( (tuple2!6815 (_1!3541 BitStream!2584) (_2!3541 BitStream!2584)) )
))
(declare-fun lt!123771 () tuple2!6814)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77270 (= e!50686 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 (_1!3541 lt!123771)))) ((_ sign_extend 32) (currentByte!3706 (_1!3541 lt!123771))) ((_ sign_extend 32) (currentBit!3701 (_1!3541 lt!123771))) nBits!322)))))

(assert (=> b!77270 (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 (_2!3540 lt!123772)))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090)) nBits!322)))

(declare-fun lt!123774 () Unit!5101)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2584 array!3236 (_ BitVec 64)) Unit!5101)

(assert (=> b!77270 (= lt!123774 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1895 (_2!3540 lt!123772)) nBits!322))))

(declare-fun reader!0 (BitStream!2584 BitStream!2584) tuple2!6814)

(assert (=> b!77270 (= lt!123771 (reader!0 thiss!1090 (_2!3540 lt!123772)))))

(declare-fun lt!123769 () Bool)

(assert (=> b!77270 (= lt!123769 (isPrefixOf!0 thiss!1090 (_2!3540 lt!123772)))))

(declare-fun lt!123773 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77270 (= lt!123773 (bitIndex!0 (size!1505 (buf!1895 (_2!3540 lt!123772))) (currentByte!3706 (_2!3540 lt!123772)) (currentBit!3701 (_2!3540 lt!123772))))))

(declare-fun lt!123777 () (_ BitVec 64))

(assert (=> b!77270 (= lt!123777 (bitIndex!0 (size!1505 (buf!1895 thiss!1090)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090)))))

(assert (=> b!77270 e!50688))

(declare-fun res!63846 () Bool)

(assert (=> b!77270 (=> (not res!63846) (not e!50688))))

(assert (=> b!77270 (= res!63846 (= (size!1505 (buf!1895 thiss!1090)) (size!1505 (buf!1895 (_2!3540 lt!123772)))))))

(declare-fun appendNBits!0 (BitStream!2584 (_ BitVec 64) Bool) tuple2!6812)

(assert (=> b!77270 (= lt!123772 (appendNBits!0 thiss!1090 nBits!322 false))))

(declare-fun b!77271 () Bool)

(declare-datatypes ((tuple2!6816 0))(
  ( (tuple2!6817 (_1!3542 BitStream!2584) (_2!3542 Bool)) )
))
(declare-fun lt!123776 () tuple2!6816)

(declare-fun lt!123770 () tuple2!6814)

(assert (=> b!77271 (= e!50688 (not (or (not (_2!3542 lt!123776)) (not (= (_1!3542 lt!123776) (_2!3541 lt!123770))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!2584 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6816)

(assert (=> b!77271 (= lt!123776 (checkBitsLoopPure!0 (_1!3541 lt!123770) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!77271 (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 (_2!3540 lt!123772)))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090)) nBits!322)))

(declare-fun lt!123775 () Unit!5101)

(assert (=> b!77271 (= lt!123775 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1895 (_2!3540 lt!123772)) nBits!322))))

(assert (=> b!77271 (= lt!123770 (reader!0 thiss!1090 (_2!3540 lt!123772)))))

(declare-fun b!77272 () Bool)

(declare-fun array_inv!1351 (array!3236) Bool)

(assert (=> b!77272 (= e!50685 (array_inv!1351 (buf!1895 thiss!1090)))))

(declare-fun b!77273 () Bool)

(declare-fun res!63850 () Bool)

(assert (=> b!77273 (=> (not res!63850) (not e!50688))))

(assert (=> b!77273 (= res!63850 (= (bitIndex!0 (size!1505 (buf!1895 (_2!3540 lt!123772))) (currentByte!3706 (_2!3540 lt!123772)) (currentBit!3701 (_2!3540 lt!123772))) (bvadd (bitIndex!0 (size!1505 (buf!1895 thiss!1090)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090)) nBits!322)))))

(declare-fun b!77274 () Bool)

(declare-fun res!63848 () Bool)

(assert (=> b!77274 (=> (not res!63848) (not e!50686))))

(assert (=> b!77274 (= res!63848 (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 thiss!1090))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090)) nBits!322))))

(assert (= (and start!15074 res!63849) b!77274))

(assert (= (and b!77274 res!63848) b!77270))

(assert (= (and b!77270 res!63846) b!77273))

(assert (= (and b!77273 res!63850) b!77269))

(assert (= (and b!77269 res!63847) b!77271))

(assert (= start!15074 b!77272))

(declare-fun m!122699 () Bool)

(assert (=> start!15074 m!122699))

(declare-fun m!122701 () Bool)

(assert (=> b!77272 m!122701))

(declare-fun m!122703 () Bool)

(assert (=> b!77271 m!122703))

(declare-fun m!122705 () Bool)

(assert (=> b!77271 m!122705))

(declare-fun m!122707 () Bool)

(assert (=> b!77271 m!122707))

(declare-fun m!122709 () Bool)

(assert (=> b!77271 m!122709))

(declare-fun m!122711 () Bool)

(assert (=> b!77270 m!122711))

(declare-fun m!122713 () Bool)

(assert (=> b!77270 m!122713))

(declare-fun m!122715 () Bool)

(assert (=> b!77270 m!122715))

(declare-fun m!122717 () Bool)

(assert (=> b!77270 m!122717))

(assert (=> b!77270 m!122709))

(declare-fun m!122719 () Bool)

(assert (=> b!77270 m!122719))

(assert (=> b!77270 m!122705))

(assert (=> b!77270 m!122707))

(assert (=> b!77273 m!122713))

(assert (=> b!77273 m!122711))

(assert (=> b!77269 m!122715))

(declare-fun m!122721 () Bool)

(assert (=> b!77274 m!122721))

(push 1)

(assert (not b!77273))

(assert (not b!77271))

(assert (not b!77270))

(assert (not start!15074))

(assert (not b!77269))

(assert (not b!77274))

(assert (not b!77272))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24382 () Bool)

(assert (=> d!24382 (= (array_inv!1351 (buf!1895 thiss!1090)) (bvsge (size!1505 (buf!1895 thiss!1090)) #b00000000000000000000000000000000))))

(assert (=> b!77272 d!24382))

(declare-fun d!24384 () Bool)

(declare-fun e!50721 () Bool)

(assert (=> d!24384 e!50721))

(declare-fun res!63897 () Bool)

(assert (=> d!24384 (=> (not res!63897) (not e!50721))))

(declare-fun lt!123882 () (_ BitVec 64))

(declare-fun lt!123880 () (_ BitVec 64))

(declare-fun lt!123881 () (_ BitVec 64))

(assert (=> d!24384 (= res!63897 (= lt!123882 (bvsub lt!123880 lt!123881)))))

(assert (=> d!24384 (or (= (bvand lt!123880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123881 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123880 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123880 lt!123881) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24384 (= lt!123881 (remainingBits!0 ((_ sign_extend 32) (size!1505 (buf!1895 (_2!3540 lt!123772)))) ((_ sign_extend 32) (currentByte!3706 (_2!3540 lt!123772))) ((_ sign_extend 32) (currentBit!3701 (_2!3540 lt!123772)))))))

(declare-fun lt!123884 () (_ BitVec 64))

(declare-fun lt!123885 () (_ BitVec 64))

(assert (=> d!24384 (= lt!123880 (bvmul lt!123884 lt!123885))))

(assert (=> d!24384 (or (= lt!123884 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123885 (bvsdiv (bvmul lt!123884 lt!123885) lt!123884)))))

(assert (=> d!24384 (= lt!123885 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24384 (= lt!123884 ((_ sign_extend 32) (size!1505 (buf!1895 (_2!3540 lt!123772)))))))

(assert (=> d!24384 (= lt!123882 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3706 (_2!3540 lt!123772))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3701 (_2!3540 lt!123772)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!24384 (invariant!0 (currentBit!3701 (_2!3540 lt!123772)) (currentByte!3706 (_2!3540 lt!123772)) (size!1505 (buf!1895 (_2!3540 lt!123772))))))

(assert (=> d!24384 (= (bitIndex!0 (size!1505 (buf!1895 (_2!3540 lt!123772))) (currentByte!3706 (_2!3540 lt!123772)) (currentBit!3701 (_2!3540 lt!123772))) lt!123882)))

(declare-fun b!77327 () Bool)

(declare-fun res!63898 () Bool)

(assert (=> b!77327 (=> (not res!63898) (not e!50721))))

(assert (=> b!77327 (= res!63898 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123882))))

(declare-fun b!77328 () Bool)

(declare-fun lt!123883 () (_ BitVec 64))

(assert (=> b!77328 (= e!50721 (bvsle lt!123882 (bvmul lt!123883 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77328 (or (= lt!123883 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123883 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123883)))))

(assert (=> b!77328 (= lt!123883 ((_ sign_extend 32) (size!1505 (buf!1895 (_2!3540 lt!123772)))))))

(assert (= (and d!24384 res!63897) b!77327))

(assert (= (and b!77327 res!63898) b!77328))

(declare-fun m!122779 () Bool)

(assert (=> d!24384 m!122779))

(declare-fun m!122781 () Bool)

(assert (=> d!24384 m!122781))

(assert (=> b!77273 d!24384))

(declare-fun d!24392 () Bool)

(declare-fun e!50722 () Bool)

(assert (=> d!24392 e!50722))

(declare-fun res!63899 () Bool)

(assert (=> d!24392 (=> (not res!63899) (not e!50722))))

(declare-fun lt!123886 () (_ BitVec 64))

(declare-fun lt!123888 () (_ BitVec 64))

(declare-fun lt!123887 () (_ BitVec 64))

(assert (=> d!24392 (= res!63899 (= lt!123888 (bvsub lt!123886 lt!123887)))))

(assert (=> d!24392 (or (= (bvand lt!123886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!123887 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!123886 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!123886 lt!123887) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24392 (= lt!123887 (remainingBits!0 ((_ sign_extend 32) (size!1505 (buf!1895 thiss!1090))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090))))))

(declare-fun lt!123890 () (_ BitVec 64))

(declare-fun lt!123891 () (_ BitVec 64))

(assert (=> d!24392 (= lt!123886 (bvmul lt!123890 lt!123891))))

(assert (=> d!24392 (or (= lt!123890 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!123891 (bvsdiv (bvmul lt!123890 lt!123891) lt!123890)))))

(assert (=> d!24392 (= lt!123891 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24392 (= lt!123890 ((_ sign_extend 32) (size!1505 (buf!1895 thiss!1090))))))

(assert (=> d!24392 (= lt!123888 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3706 thiss!1090)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3701 thiss!1090))))))

(assert (=> d!24392 (invariant!0 (currentBit!3701 thiss!1090) (currentByte!3706 thiss!1090) (size!1505 (buf!1895 thiss!1090)))))

(assert (=> d!24392 (= (bitIndex!0 (size!1505 (buf!1895 thiss!1090)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090)) lt!123888)))

(declare-fun b!77329 () Bool)

(declare-fun res!63900 () Bool)

(assert (=> b!77329 (=> (not res!63900) (not e!50722))))

(assert (=> b!77329 (= res!63900 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!123888))))

(declare-fun b!77330 () Bool)

(declare-fun lt!123889 () (_ BitVec 64))

(assert (=> b!77330 (= e!50722 (bvsle lt!123888 (bvmul lt!123889 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!77330 (or (= lt!123889 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!123889 #b0000000000000000000000000000000000000000000000000000000000001000) lt!123889)))))

(assert (=> b!77330 (= lt!123889 ((_ sign_extend 32) (size!1505 (buf!1895 thiss!1090))))))

(assert (= (and d!24392 res!63899) b!77329))

(assert (= (and b!77329 res!63900) b!77330))

(declare-fun m!122783 () Bool)

(assert (=> d!24392 m!122783))

(declare-fun m!122785 () Bool)

(assert (=> d!24392 m!122785))

(assert (=> b!77273 d!24392))

(declare-fun d!24394 () Bool)

(assert (=> d!24394 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 thiss!1090))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1505 (buf!1895 thiss!1090))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090))) nBits!322))))

(declare-fun bs!5902 () Bool)

(assert (= bs!5902 d!24394))

(assert (=> bs!5902 m!122783))

(assert (=> b!77274 d!24394))

(declare-fun d!24400 () Bool)

(declare-fun res!63911 () Bool)

(declare-fun e!50730 () Bool)

(assert (=> d!24400 (=> (not res!63911) (not e!50730))))

(assert (=> d!24400 (= res!63911 (= (size!1505 (buf!1895 thiss!1090)) (size!1505 (buf!1895 (_2!3540 lt!123772)))))))

(assert (=> d!24400 (= (isPrefixOf!0 thiss!1090 (_2!3540 lt!123772)) e!50730)))

(declare-fun b!77341 () Bool)

(declare-fun res!63913 () Bool)

(assert (=> b!77341 (=> (not res!63913) (not e!50730))))

(assert (=> b!77341 (= res!63913 (bvsle (bitIndex!0 (size!1505 (buf!1895 thiss!1090)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090)) (bitIndex!0 (size!1505 (buf!1895 (_2!3540 lt!123772))) (currentByte!3706 (_2!3540 lt!123772)) (currentBit!3701 (_2!3540 lt!123772)))))))

(declare-fun b!77342 () Bool)

(declare-fun e!50729 () Bool)

(assert (=> b!77342 (= e!50730 e!50729)))

(declare-fun res!63912 () Bool)

(assert (=> b!77342 (=> res!63912 e!50729)))

(assert (=> b!77342 (= res!63912 (= (size!1505 (buf!1895 thiss!1090)) #b00000000000000000000000000000000))))

(declare-fun b!77343 () Bool)

(declare-fun arrayBitRangesEq!0 (array!3236 array!3236 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77343 (= e!50729 (arrayBitRangesEq!0 (buf!1895 thiss!1090) (buf!1895 (_2!3540 lt!123772)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1505 (buf!1895 thiss!1090)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090))))))

(assert (= (and d!24400 res!63911) b!77341))

(assert (= (and b!77341 res!63913) b!77342))

(assert (= (and b!77342 (not res!63912)) b!77343))

(assert (=> b!77341 m!122711))

(assert (=> b!77341 m!122713))

(assert (=> b!77343 m!122711))

(assert (=> b!77343 m!122711))

(declare-fun m!122805 () Bool)

(assert (=> b!77343 m!122805))

(assert (=> b!77269 d!24400))

(declare-fun d!24412 () Bool)

(assert (=> d!24412 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 (_1!3541 lt!123771)))) ((_ sign_extend 32) (currentByte!3706 (_1!3541 lt!123771))) ((_ sign_extend 32) (currentBit!3701 (_1!3541 lt!123771))) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1505 (buf!1895 (_1!3541 lt!123771)))) ((_ sign_extend 32) (currentByte!3706 (_1!3541 lt!123771))) ((_ sign_extend 32) (currentBit!3701 (_1!3541 lt!123771)))) nBits!322))))

(declare-fun bs!5908 () Bool)

(assert (= bs!5908 d!24412))

(declare-fun m!122807 () Bool)

(assert (=> bs!5908 m!122807))

(assert (=> b!77270 d!24412))

(assert (=> b!77270 d!24400))

(assert (=> b!77270 d!24392))

(declare-fun d!24414 () Bool)

(assert (=> d!24414 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 (_2!3540 lt!123772)))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090)) nBits!322) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1505 (buf!1895 (_2!3540 lt!123772)))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090))) nBits!322))))

(declare-fun bs!5909 () Bool)

(assert (= bs!5909 d!24414))

(declare-fun m!122809 () Bool)

(assert (=> bs!5909 m!122809))

(assert (=> b!77270 d!24414))

(declare-fun d!24416 () Bool)

(assert (=> d!24416 (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 (_2!3540 lt!123772)))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090)) nBits!322)))

(declare-fun lt!123918 () Unit!5101)

(declare-fun choose!9 (BitStream!2584 array!3236 (_ BitVec 64) BitStream!2584) Unit!5101)

(assert (=> d!24416 (= lt!123918 (choose!9 thiss!1090 (buf!1895 (_2!3540 lt!123772)) nBits!322 (BitStream!2585 (buf!1895 (_2!3540 lt!123772)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090))))))

(assert (=> d!24416 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1895 (_2!3540 lt!123772)) nBits!322) lt!123918)))

(declare-fun bs!5911 () Bool)

(assert (= bs!5911 d!24416))

(assert (=> bs!5911 m!122705))

(declare-fun m!122813 () Bool)

(assert (=> bs!5911 m!122813))

(assert (=> b!77270 d!24416))

(declare-fun b!77384 () Bool)

(declare-fun e!50748 () Unit!5101)

(declare-fun lt!124080 () Unit!5101)

(assert (=> b!77384 (= e!50748 lt!124080)))

(declare-fun lt!124082 () (_ BitVec 64))

(assert (=> b!77384 (= lt!124082 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!124084 () (_ BitVec 64))

(assert (=> b!77384 (= lt!124084 (bitIndex!0 (size!1505 (buf!1895 thiss!1090)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!3236 array!3236 (_ BitVec 64) (_ BitVec 64)) Unit!5101)

(assert (=> b!77384 (= lt!124080 (arrayBitRangesEqSymmetric!0 (buf!1895 thiss!1090) (buf!1895 (_2!3540 lt!123772)) lt!124082 lt!124084))))

(assert (=> b!77384 (arrayBitRangesEq!0 (buf!1895 (_2!3540 lt!123772)) (buf!1895 thiss!1090) lt!124082 lt!124084)))

(declare-fun b!77385 () Bool)

(declare-fun Unit!5108 () Unit!5101)

(assert (=> b!77385 (= e!50748 Unit!5108)))

(declare-fun lt!124093 () (_ BitVec 64))

(declare-fun lt!124096 () tuple2!6814)

(declare-fun e!50747 () Bool)

(declare-fun lt!124088 () (_ BitVec 64))

(declare-fun b!77386 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2584 (_ BitVec 64)) BitStream!2584)

(assert (=> b!77386 (= e!50747 (= (_1!3541 lt!124096) (withMovedBitIndex!0 (_2!3541 lt!124096) (bvsub lt!124088 lt!124093))))))

(assert (=> b!77386 (or (= (bvand lt!124088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124093 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!124088 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!124088 lt!124093) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77386 (= lt!124093 (bitIndex!0 (size!1505 (buf!1895 (_2!3540 lt!123772))) (currentByte!3706 (_2!3540 lt!123772)) (currentBit!3701 (_2!3540 lt!123772))))))

(assert (=> b!77386 (= lt!124088 (bitIndex!0 (size!1505 (buf!1895 thiss!1090)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090)))))

(declare-fun b!77387 () Bool)

(declare-fun res!63938 () Bool)

(assert (=> b!77387 (=> (not res!63938) (not e!50747))))

(assert (=> b!77387 (= res!63938 (isPrefixOf!0 (_2!3541 lt!124096) (_2!3540 lt!123772)))))

(declare-fun d!24420 () Bool)

(assert (=> d!24420 e!50747))

(declare-fun res!63939 () Bool)

(assert (=> d!24420 (=> (not res!63939) (not e!50747))))

(assert (=> d!24420 (= res!63939 (isPrefixOf!0 (_1!3541 lt!124096) (_2!3541 lt!124096)))))

(declare-fun lt!124081 () BitStream!2584)

(assert (=> d!24420 (= lt!124096 (tuple2!6815 lt!124081 (_2!3540 lt!123772)))))

(declare-fun lt!124079 () Unit!5101)

(declare-fun lt!124089 () Unit!5101)

(assert (=> d!24420 (= lt!124079 lt!124089)))

(assert (=> d!24420 (isPrefixOf!0 lt!124081 (_2!3540 lt!123772))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2584 BitStream!2584 BitStream!2584) Unit!5101)

(assert (=> d!24420 (= lt!124089 (lemmaIsPrefixTransitive!0 lt!124081 (_2!3540 lt!123772) (_2!3540 lt!123772)))))

(declare-fun lt!124098 () Unit!5101)

(declare-fun lt!124085 () Unit!5101)

(assert (=> d!24420 (= lt!124098 lt!124085)))

(assert (=> d!24420 (isPrefixOf!0 lt!124081 (_2!3540 lt!123772))))

(assert (=> d!24420 (= lt!124085 (lemmaIsPrefixTransitive!0 lt!124081 thiss!1090 (_2!3540 lt!123772)))))

(declare-fun lt!124090 () Unit!5101)

(assert (=> d!24420 (= lt!124090 e!50748)))

(declare-fun c!5603 () Bool)

(assert (=> d!24420 (= c!5603 (not (= (size!1505 (buf!1895 thiss!1090)) #b00000000000000000000000000000000)))))

(declare-fun lt!124094 () Unit!5101)

(declare-fun lt!124095 () Unit!5101)

(assert (=> d!24420 (= lt!124094 lt!124095)))

(assert (=> d!24420 (isPrefixOf!0 (_2!3540 lt!123772) (_2!3540 lt!123772))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2584) Unit!5101)

(assert (=> d!24420 (= lt!124095 (lemmaIsPrefixRefl!0 (_2!3540 lt!123772)))))

(declare-fun lt!124083 () Unit!5101)

(declare-fun lt!124097 () Unit!5101)

(assert (=> d!24420 (= lt!124083 lt!124097)))

(assert (=> d!24420 (= lt!124097 (lemmaIsPrefixRefl!0 (_2!3540 lt!123772)))))

(declare-fun lt!124092 () Unit!5101)

(declare-fun lt!124087 () Unit!5101)

(assert (=> d!24420 (= lt!124092 lt!124087)))

(assert (=> d!24420 (isPrefixOf!0 lt!124081 lt!124081)))

(assert (=> d!24420 (= lt!124087 (lemmaIsPrefixRefl!0 lt!124081))))

(declare-fun lt!124086 () Unit!5101)

(declare-fun lt!124091 () Unit!5101)

(assert (=> d!24420 (= lt!124086 lt!124091)))

(assert (=> d!24420 (isPrefixOf!0 thiss!1090 thiss!1090)))

(assert (=> d!24420 (= lt!124091 (lemmaIsPrefixRefl!0 thiss!1090))))

(assert (=> d!24420 (= lt!124081 (BitStream!2585 (buf!1895 (_2!3540 lt!123772)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090)))))

(assert (=> d!24420 (isPrefixOf!0 thiss!1090 (_2!3540 lt!123772))))

(assert (=> d!24420 (= (reader!0 thiss!1090 (_2!3540 lt!123772)) lt!124096)))

(declare-fun b!77388 () Bool)

(declare-fun res!63940 () Bool)

(assert (=> b!77388 (=> (not res!63940) (not e!50747))))

(assert (=> b!77388 (= res!63940 (isPrefixOf!0 (_1!3541 lt!124096) thiss!1090))))

(assert (= (and d!24420 c!5603) b!77384))

(assert (= (and d!24420 (not c!5603)) b!77385))

(assert (= (and d!24420 res!63939) b!77388))

(assert (= (and b!77388 res!63940) b!77387))

(assert (= (and b!77387 res!63938) b!77386))

(declare-fun m!122853 () Bool)

(assert (=> b!77388 m!122853))

(declare-fun m!122859 () Bool)

(assert (=> b!77386 m!122859))

(assert (=> b!77386 m!122713))

(assert (=> b!77386 m!122711))

(assert (=> b!77384 m!122711))

(declare-fun m!122873 () Bool)

(assert (=> b!77384 m!122873))

(declare-fun m!122879 () Bool)

(assert (=> b!77384 m!122879))

(declare-fun m!122883 () Bool)

(assert (=> b!77387 m!122883))

(declare-fun m!122885 () Bool)

(assert (=> d!24420 m!122885))

(declare-fun m!122887 () Bool)

(assert (=> d!24420 m!122887))

(assert (=> d!24420 m!122715))

(declare-fun m!122889 () Bool)

(assert (=> d!24420 m!122889))

(declare-fun m!122891 () Bool)

(assert (=> d!24420 m!122891))

(declare-fun m!122893 () Bool)

(assert (=> d!24420 m!122893))

(declare-fun m!122895 () Bool)

(assert (=> d!24420 m!122895))

(declare-fun m!122897 () Bool)

(assert (=> d!24420 m!122897))

(declare-fun m!122899 () Bool)

(assert (=> d!24420 m!122899))

(declare-fun m!122901 () Bool)

(assert (=> d!24420 m!122901))

(declare-fun m!122903 () Bool)

(assert (=> d!24420 m!122903))

(assert (=> b!77270 d!24420))

(assert (=> b!77270 d!24384))

(declare-fun b!77424 () Bool)

(declare-fun res!63976 () Bool)

(declare-fun e!50769 () Bool)

(assert (=> b!77424 (=> (not res!63976) (not e!50769))))

(declare-fun lt!124127 () tuple2!6812)

(assert (=> b!77424 (= res!63976 (isPrefixOf!0 thiss!1090 (_2!3540 lt!124127)))))

(declare-fun d!24426 () Bool)

(assert (=> d!24426 e!50769))

(declare-fun res!63975 () Bool)

(assert (=> d!24426 (=> (not res!63975) (not e!50769))))

(assert (=> d!24426 (= res!63975 (= (size!1505 (buf!1895 thiss!1090)) (size!1505 (buf!1895 (_2!3540 lt!124127)))))))

(declare-fun choose!36 (BitStream!2584 (_ BitVec 64) Bool) tuple2!6812)

(assert (=> d!24426 (= lt!124127 (choose!36 thiss!1090 nBits!322 false))))

(assert (=> d!24426 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!322) (bvsle nBits!322 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!24426 (= (appendNBits!0 thiss!1090 nBits!322 false) lt!124127)))

(declare-fun b!77425 () Bool)

(declare-fun lt!124128 () tuple2!6816)

(declare-fun lt!124124 () tuple2!6814)

(assert (=> b!77425 (= e!50769 (and (_2!3542 lt!124128) (= (_1!3542 lt!124128) (_2!3541 lt!124124))))))

(assert (=> b!77425 (= lt!124128 (checkBitsLoopPure!0 (_1!3541 lt!124124) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!124126 () Unit!5101)

(declare-fun lt!124125 () Unit!5101)

(assert (=> b!77425 (= lt!124126 lt!124125)))

(assert (=> b!77425 (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 (_2!3540 lt!124127)))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090)) nBits!322)))

(assert (=> b!77425 (= lt!124125 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1090 (buf!1895 (_2!3540 lt!124127)) nBits!322))))

(declare-fun e!50770 () Bool)

(assert (=> b!77425 e!50770))

(declare-fun res!63978 () Bool)

(assert (=> b!77425 (=> (not res!63978) (not e!50770))))

(assert (=> b!77425 (= res!63978 (and (= (size!1505 (buf!1895 thiss!1090)) (size!1505 (buf!1895 (_2!3540 lt!124127)))) (bvsge nBits!322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77425 (= lt!124124 (reader!0 thiss!1090 (_2!3540 lt!124127)))))

(declare-fun b!77426 () Bool)

(assert (=> b!77426 (= e!50770 (validate_offset_bits!1 ((_ sign_extend 32) (size!1505 (buf!1895 thiss!1090))) ((_ sign_extend 32) (currentByte!3706 thiss!1090)) ((_ sign_extend 32) (currentBit!3701 thiss!1090)) nBits!322))))

(declare-fun b!77423 () Bool)

(declare-fun res!63977 () Bool)

(assert (=> b!77423 (=> (not res!63977) (not e!50769))))

(declare-fun lt!124123 () (_ BitVec 64))

(assert (=> b!77423 (= res!63977 (= (bitIndex!0 (size!1505 (buf!1895 (_2!3540 lt!124127))) (currentByte!3706 (_2!3540 lt!124127)) (currentBit!3701 (_2!3540 lt!124127))) (bvadd lt!124123 nBits!322)))))

(assert (=> b!77423 (or (not (= (bvand lt!124123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!322 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!124123 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!124123 nBits!322) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!77423 (= lt!124123 (bitIndex!0 (size!1505 (buf!1895 thiss!1090)) (currentByte!3706 thiss!1090) (currentBit!3701 thiss!1090)))))

(assert (= (and d!24426 res!63975) b!77423))

(assert (= (and b!77423 res!63977) b!77424))

(assert (= (and b!77424 res!63976) b!77425))

(assert (= (and b!77425 res!63978) b!77426))

(assert (=> b!77426 m!122721))

(declare-fun m!122913 () Bool)

(assert (=> b!77424 m!122913))

(declare-fun m!122915 () Bool)

(assert (=> b!77423 m!122915))

(assert (=> b!77423 m!122711))

(declare-fun m!122917 () Bool)

(assert (=> d!24426 m!122917))

(declare-fun m!122919 () Bool)

(assert (=> b!77425 m!122919))

(declare-fun m!122921 () Bool)

(assert (=> b!77425 m!122921))

(declare-fun m!122923 () Bool)

(assert (=> b!77425 m!122923))

(declare-fun m!122925 () Bool)

(assert (=> b!77425 m!122925))

(assert (=> b!77270 d!24426))

(declare-fun d!24444 () Bool)

(declare-datatypes ((tuple2!6834 0))(
  ( (tuple2!6835 (_1!3551 Bool) (_2!3551 BitStream!2584)) )
))
(declare-fun lt!124149 () tuple2!6834)

(declare-fun checkBitsLoop!0 (BitStream!2584 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!6834)

(assert (=> d!24444 (= lt!124149 (checkBitsLoop!0 (_1!3541 lt!123770) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!24444 (= (checkBitsLoopPure!0 (_1!3541 lt!123770) nBits!322 false #b0000000000000000000000000000000000000000000000000000000000000000) (tuple2!6817 (_2!3551 lt!124149) (_1!3551 lt!124149)))))

(declare-fun bs!5918 () Bool)

(assert (= bs!5918 d!24444))

(declare-fun m!122941 () Bool)

(assert (=> bs!5918 m!122941))

(assert (=> b!77271 d!24444))

(assert (=> b!77271 d!24414))

(assert (=> b!77271 d!24416))

(assert (=> b!77271 d!24420))

(declare-fun d!24450 () Bool)

(assert (=> d!24450 (= (inv!12 thiss!1090) (invariant!0 (currentBit!3701 thiss!1090) (currentByte!3706 thiss!1090) (size!1505 (buf!1895 thiss!1090))))))

(declare-fun bs!5919 () Bool)

(assert (= bs!5919 d!24450))

(assert (=> bs!5919 m!122785))

(assert (=> start!15074 d!24450))

(push 1)

(assert (not b!77343))

(assert (not b!77426))

(assert (not b!77384))

(assert (not b!77423))

(assert (not d!24426))

(assert (not b!77424))

(assert (not d!24450))

(assert (not d!24412))

(assert (not d!24416))

(assert (not d!24394))

(assert (not d!24414))

(assert (not b!77388))

(assert (not d!24420))

(assert (not b!77387))

(assert (not b!77425))

(assert (not b!77386))

(assert (not d!24384))

(assert (not b!77341))

(assert (not d!24444))

(assert (not d!24392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

