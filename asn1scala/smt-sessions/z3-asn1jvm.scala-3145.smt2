; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72202 () Bool)

(assert start!72202)

(declare-fun b!323770 () Bool)

(declare-fun e!233241 () Bool)

(declare-fun e!233242 () Bool)

(assert (=> b!323770 (= e!233241 e!233242)))

(declare-fun res!265794 () Bool)

(assert (=> b!323770 (=> res!265794 e!233242)))

(declare-datatypes ((array!20694 0))(
  ( (array!20695 (arr!10100 (Array (_ BitVec 32) (_ BitVec 8))) (size!9008 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14178 0))(
  ( (BitStream!14179 (buf!8150 array!20694) (currentByte!15027 (_ BitVec 32)) (currentBit!15022 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!23726 0))(
  ( (tuple2!23727 (_1!13492 (_ BitVec 64)) (_2!13492 BitStream!14178)) )
))
(declare-fun lt!446199 () tuple2!23726)

(declare-fun thiss!1793 () BitStream!14178)

(assert (=> b!323770 (= res!265794 (not (= (buf!8150 (_2!13492 lt!446199)) (buf!8150 thiss!1793))))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun acc!161 () (_ BitVec 64))

(declare-datatypes ((tuple2!23728 0))(
  ( (tuple2!23729 (_1!13493 Bool) (_2!13493 BitStream!14178)) )
))
(declare-fun lt!446201 () tuple2!23728)

(declare-fun readNBitsLSBFirstsLoop!0 (BitStream!14178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!23726)

(assert (=> b!323770 (= lt!446199 (readNBitsLSBFirstsLoop!0 (_2!13493 lt!446201) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13493 lt!446201) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!14178) tuple2!23728)

(assert (=> b!323770 (= lt!446201 (readBit!0 thiss!1793))))

(declare-fun b!323771 () Bool)

(declare-fun res!265798 () Bool)

(assert (=> b!323771 (=> (not res!265798) (not e!233241))))

(assert (=> b!323771 (= res!265798 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (not (= nBits!548 i!743))))))

(declare-fun res!265795 () Bool)

(declare-fun e!233239 () Bool)

(assert (=> start!72202 (=> (not res!265795) (not e!233239))))

(assert (=> start!72202 (= res!265795 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72202 e!233239))

(assert (=> start!72202 true))

(declare-fun e!233240 () Bool)

(declare-fun inv!12 (BitStream!14178) Bool)

(assert (=> start!72202 (and (inv!12 thiss!1793) e!233240)))

(declare-fun b!323772 () Bool)

(declare-fun e!233244 () Bool)

(declare-fun e!233238 () Bool)

(assert (=> b!323772 (= e!233244 e!233238)))

(declare-fun res!265792 () Bool)

(assert (=> b!323772 (=> (not res!265792) (not e!233238))))

(assert (=> b!323772 (= res!265792 (bvslt i!743 nBits!548))))

(declare-fun b!323773 () Bool)

(assert (=> b!323773 (= e!233239 e!233241)))

(declare-fun res!265793 () Bool)

(assert (=> b!323773 (=> (not res!265793) (not e!233241))))

(declare-fun lt!446198 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323773 (= res!265793 (validate_offset_bits!1 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793)) lt!446198))))

(assert (=> b!323773 (= lt!446198 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!323774 () Bool)

(declare-datatypes ((tuple2!23730 0))(
  ( (tuple2!23731 (_1!13494 BitStream!14178) (_2!13494 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!14178) tuple2!23730)

(assert (=> b!323774 (= e!233238 (not (= (= (bvand (bvlshr (_1!13492 lt!446199) ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13494 (readBitPure!0 thiss!1793)))))))

(declare-fun b!323775 () Bool)

(declare-fun array_inv!8560 (array!20694) Bool)

(assert (=> b!323775 (= e!233240 (array_inv!8560 (buf!8150 thiss!1793)))))

(declare-fun b!323776 () Bool)

(declare-fun res!265790 () Bool)

(assert (=> b!323776 (=> res!265790 e!233242)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323776 (= res!265790 (not (= (bitIndex!0 (size!9008 (buf!8150 (_2!13492 lt!446199))) (currentByte!15027 (_2!13492 lt!446199)) (currentBit!15022 (_2!13492 lt!446199))) (bvadd (bitIndex!0 (size!9008 (buf!8150 thiss!1793)) (currentByte!15027 thiss!1793) (currentBit!15022 thiss!1793)) lt!446198))))))

(declare-fun b!323777 () Bool)

(assert (=> b!323777 (= e!233242 e!233244)))

(declare-fun res!265797 () Bool)

(assert (=> b!323777 (=> res!265797 e!233244)))

(declare-fun lt!446200 () (_ BitVec 64))

(assert (=> b!323777 (= res!265797 (not (= (bvand (_1!13492 lt!446199) lt!446200) (bvand acc!161 lt!446200))))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323777 (= lt!446200 (onesLSBLong!0 i!743))))

(declare-fun b!323778 () Bool)

(declare-fun res!265791 () Bool)

(assert (=> b!323778 (=> res!265791 e!233244)))

(assert (=> b!323778 (= res!265791 (not (= (bvand (_1!13492 lt!446199) (onesLSBLong!0 nBits!548)) (_1!13492 lt!446199))))))

(declare-fun b!323779 () Bool)

(declare-fun res!265796 () Bool)

(assert (=> b!323779 (=> (not res!265796) (not e!233241))))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323779 (= res!265796 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!72202 res!265795) b!323773))

(assert (= (and b!323773 res!265793) b!323779))

(assert (= (and b!323779 res!265796) b!323771))

(assert (= (and b!323771 res!265798) b!323770))

(assert (= (and b!323770 (not res!265794)) b!323776))

(assert (= (and b!323776 (not res!265790)) b!323777))

(assert (= (and b!323777 (not res!265797)) b!323778))

(assert (= (and b!323778 (not res!265791)) b!323772))

(assert (= (and b!323772 res!265792) b!323774))

(assert (= start!72202 b!323775))

(declare-fun m!461767 () Bool)

(assert (=> b!323775 m!461767))

(declare-fun m!461769 () Bool)

(assert (=> start!72202 m!461769))

(declare-fun m!461771 () Bool)

(assert (=> b!323776 m!461771))

(declare-fun m!461773 () Bool)

(assert (=> b!323776 m!461773))

(declare-fun m!461775 () Bool)

(assert (=> b!323773 m!461775))

(declare-fun m!461777 () Bool)

(assert (=> b!323770 m!461777))

(declare-fun m!461779 () Bool)

(assert (=> b!323770 m!461779))

(declare-fun m!461781 () Bool)

(assert (=> b!323777 m!461781))

(declare-fun m!461783 () Bool)

(assert (=> b!323779 m!461783))

(declare-fun m!461785 () Bool)

(assert (=> b!323774 m!461785))

(declare-fun m!461787 () Bool)

(assert (=> b!323778 m!461787))

(check-sat (not start!72202) (not b!323774) (not b!323775) (not b!323778) (not b!323779) (not b!323777) (not b!323776) (not b!323773) (not b!323770))
(check-sat)
(get-model)

(declare-fun d!106108 () Bool)

(assert (=> d!106108 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!323779 d!106108))

(declare-fun d!106110 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106110 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793)) lt!446198) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793))) lt!446198))))

(declare-fun bs!27960 () Bool)

(assert (= bs!27960 d!106110))

(declare-fun m!461811 () Bool)

(assert (=> bs!27960 m!461811))

(assert (=> b!323773 d!106110))

(declare-fun d!106112 () Bool)

(assert (=> d!106112 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!323778 d!106112))

(declare-fun d!106114 () Bool)

(assert (=> d!106114 (= (onesLSBLong!0 i!743) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!743))))))

(assert (=> b!323777 d!106114))

(declare-fun d!106116 () Bool)

(declare-fun e!233268 () Bool)

(assert (=> d!106116 e!233268))

(declare-fun res!265831 () Bool)

(assert (=> d!106116 (=> (not res!265831) (not e!233268))))

(declare-fun lt!446228 () (_ BitVec 64))

(declare-fun lt!446230 () (_ BitVec 64))

(declare-fun lt!446229 () (_ BitVec 64))

(assert (=> d!106116 (= res!265831 (= lt!446228 (bvsub lt!446229 lt!446230)))))

(assert (=> d!106116 (or (= (bvand lt!446229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446230 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446229 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446229 lt!446230) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106116 (= lt!446230 (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13492 lt!446199)))) ((_ sign_extend 32) (currentByte!15027 (_2!13492 lt!446199))) ((_ sign_extend 32) (currentBit!15022 (_2!13492 lt!446199)))))))

(declare-fun lt!446227 () (_ BitVec 64))

(declare-fun lt!446231 () (_ BitVec 64))

(assert (=> d!106116 (= lt!446229 (bvmul lt!446227 lt!446231))))

(assert (=> d!106116 (or (= lt!446227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446231 (bvsdiv (bvmul lt!446227 lt!446231) lt!446227)))))

(assert (=> d!106116 (= lt!446231 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106116 (= lt!446227 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13492 lt!446199)))))))

(assert (=> d!106116 (= lt!446228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15027 (_2!13492 lt!446199))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15022 (_2!13492 lt!446199)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106116 (invariant!0 (currentBit!15022 (_2!13492 lt!446199)) (currentByte!15027 (_2!13492 lt!446199)) (size!9008 (buf!8150 (_2!13492 lt!446199))))))

(assert (=> d!106116 (= (bitIndex!0 (size!9008 (buf!8150 (_2!13492 lt!446199))) (currentByte!15027 (_2!13492 lt!446199)) (currentBit!15022 (_2!13492 lt!446199))) lt!446228)))

(declare-fun b!323814 () Bool)

(declare-fun res!265830 () Bool)

(assert (=> b!323814 (=> (not res!265830) (not e!233268))))

(assert (=> b!323814 (= res!265830 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446228))))

(declare-fun b!323815 () Bool)

(declare-fun lt!446226 () (_ BitVec 64))

(assert (=> b!323815 (= e!233268 (bvsle lt!446228 (bvmul lt!446226 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323815 (or (= lt!446226 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446226 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446226)))))

(assert (=> b!323815 (= lt!446226 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13492 lt!446199)))))))

(assert (= (and d!106116 res!265831) b!323814))

(assert (= (and b!323814 res!265830) b!323815))

(declare-fun m!461813 () Bool)

(assert (=> d!106116 m!461813))

(declare-fun m!461815 () Bool)

(assert (=> d!106116 m!461815))

(assert (=> b!323776 d!106116))

(declare-fun d!106118 () Bool)

(declare-fun e!233269 () Bool)

(assert (=> d!106118 e!233269))

(declare-fun res!265833 () Bool)

(assert (=> d!106118 (=> (not res!265833) (not e!233269))))

(declare-fun lt!446235 () (_ BitVec 64))

(declare-fun lt!446234 () (_ BitVec 64))

(declare-fun lt!446236 () (_ BitVec 64))

(assert (=> d!106118 (= res!265833 (= lt!446234 (bvsub lt!446235 lt!446236)))))

(assert (=> d!106118 (or (= (bvand lt!446235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446236 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446235 lt!446236) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106118 (= lt!446236 (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793))))))

(declare-fun lt!446233 () (_ BitVec 64))

(declare-fun lt!446237 () (_ BitVec 64))

(assert (=> d!106118 (= lt!446235 (bvmul lt!446233 lt!446237))))

(assert (=> d!106118 (or (= lt!446233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446237 (bvsdiv (bvmul lt!446233 lt!446237) lt!446233)))))

(assert (=> d!106118 (= lt!446237 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106118 (= lt!446233 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))))))

(assert (=> d!106118 (= lt!446234 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15027 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15022 thiss!1793))))))

(assert (=> d!106118 (invariant!0 (currentBit!15022 thiss!1793) (currentByte!15027 thiss!1793) (size!9008 (buf!8150 thiss!1793)))))

(assert (=> d!106118 (= (bitIndex!0 (size!9008 (buf!8150 thiss!1793)) (currentByte!15027 thiss!1793) (currentBit!15022 thiss!1793)) lt!446234)))

(declare-fun b!323816 () Bool)

(declare-fun res!265832 () Bool)

(assert (=> b!323816 (=> (not res!265832) (not e!233269))))

(assert (=> b!323816 (= res!265832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446234))))

(declare-fun b!323817 () Bool)

(declare-fun lt!446232 () (_ BitVec 64))

(assert (=> b!323817 (= e!233269 (bvsle lt!446234 (bvmul lt!446232 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323817 (or (= lt!446232 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446232 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446232)))))

(assert (=> b!323817 (= lt!446232 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))))))

(assert (= (and d!106118 res!265833) b!323816))

(assert (= (and b!323816 res!265832) b!323817))

(assert (=> d!106118 m!461811))

(declare-fun m!461817 () Bool)

(assert (=> d!106118 m!461817))

(assert (=> b!323776 d!106118))

(declare-fun lt!446267 () tuple2!23726)

(declare-fun e!233282 () Bool)

(declare-fun b!323846 () Bool)

(declare-fun lt!446262 () (_ BitVec 64))

(assert (=> b!323846 (= e!233282 (= (= (bvand (bvlshr (_1!13492 lt!446267) lt!446262) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13494 (readBitPure!0 (_2!13493 lt!446201)))))))

(assert (=> b!323846 (and (bvsge lt!446262 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!446262 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323846 (= lt!446262 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743)))))

(declare-fun e!233284 () tuple2!23726)

(declare-fun b!323847 () Bool)

(assert (=> b!323847 (= e!233284 (tuple2!23727 (bvor acc!161 (ite (_1!13493 lt!446201) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13493 lt!446201)))))

(declare-fun b!323848 () Bool)

(declare-fun e!233283 () Bool)

(assert (=> b!323848 (= e!233283 e!233282)))

(declare-fun res!265857 () Bool)

(assert (=> b!323848 (=> res!265857 e!233282)))

(assert (=> b!323848 (= res!265857 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743) nBits!548)))))

(declare-fun b!323849 () Bool)

(declare-fun res!265856 () Bool)

(assert (=> b!323849 (=> (not res!265856) (not e!233283))))

(assert (=> b!323849 (= res!265856 (= (bvand (_1!13492 lt!446267) (onesLSBLong!0 nBits!548)) (_1!13492 lt!446267)))))

(declare-fun d!106120 () Bool)

(assert (=> d!106120 e!233283))

(declare-fun res!265858 () Bool)

(assert (=> d!106120 (=> (not res!265858) (not e!233283))))

(assert (=> d!106120 (= res!265858 (= (buf!8150 (_2!13492 lt!446267)) (buf!8150 (_2!13493 lt!446201))))))

(assert (=> d!106120 (= lt!446267 e!233284)))

(declare-fun c!15456 () Bool)

(assert (=> d!106120 (= c!15456 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743)))))

(assert (=> d!106120 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743)) (bvsle (bvadd #b00000000000000000000000000000001 i!743) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!106120 (= (readNBitsLSBFirstsLoop!0 (_2!13493 lt!446201) nBits!548 (bvadd #b00000000000000000000000000000001 i!743) (bvor acc!161 (ite (_1!13493 lt!446201) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!446267)))

(declare-fun b!323850 () Bool)

(declare-fun res!265854 () Bool)

(assert (=> b!323850 (=> (not res!265854) (not e!233283))))

(assert (=> b!323850 (= res!265854 (= (bvand (_1!13492 lt!446267) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743))) (bvand (bvor acc!161 (ite (_1!13493 lt!446201) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)))))))

(declare-fun b!323851 () Bool)

(declare-fun lt!446263 () tuple2!23726)

(assert (=> b!323851 (= e!233284 (tuple2!23727 (_1!13492 lt!446263) (_2!13492 lt!446263)))))

(declare-fun lt!446264 () tuple2!23728)

(assert (=> b!323851 (= lt!446264 (readBit!0 (_2!13493 lt!446201)))))

(assert (=> b!323851 (= lt!446263 (readNBitsLSBFirstsLoop!0 (_2!13493 lt!446264) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13493 lt!446201) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13493 lt!446264) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!323852 () Bool)

(declare-fun res!265855 () Bool)

(assert (=> b!323852 (=> (not res!265855) (not e!233283))))

(declare-fun lt!446265 () (_ BitVec 64))

(declare-fun lt!446266 () (_ BitVec 64))

(assert (=> b!323852 (= res!265855 (= (bitIndex!0 (size!9008 (buf!8150 (_2!13492 lt!446267))) (currentByte!15027 (_2!13492 lt!446267)) (currentBit!15022 (_2!13492 lt!446267))) (bvadd lt!446266 lt!446265)))))

(assert (=> b!323852 (or (not (= (bvand lt!446266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446265 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446266 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446266 lt!446265) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323852 (= lt!446265 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743))))))

(assert (=> b!323852 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743)) #b10000000000000000000000000000000)))))

(assert (=> b!323852 (= lt!446266 (bitIndex!0 (size!9008 (buf!8150 (_2!13493 lt!446201))) (currentByte!15027 (_2!13493 lt!446201)) (currentBit!15022 (_2!13493 lt!446201))))))

(assert (= (and d!106120 c!15456) b!323847))

(assert (= (and d!106120 (not c!15456)) b!323851))

(assert (= (and d!106120 res!265858) b!323852))

(assert (= (and b!323852 res!265855) b!323850))

(assert (= (and b!323850 res!265854) b!323849))

(assert (= (and b!323849 res!265856) b!323848))

(assert (= (and b!323848 (not res!265857)) b!323846))

(declare-fun m!461821 () Bool)

(assert (=> b!323851 m!461821))

(declare-fun m!461823 () Bool)

(assert (=> b!323851 m!461823))

(declare-fun m!461825 () Bool)

(assert (=> b!323850 m!461825))

(declare-fun m!461827 () Bool)

(assert (=> b!323852 m!461827))

(declare-fun m!461829 () Bool)

(assert (=> b!323852 m!461829))

(declare-fun m!461831 () Bool)

(assert (=> b!323846 m!461831))

(assert (=> b!323849 m!461787))

(assert (=> b!323770 d!106120))

(declare-fun d!106134 () Bool)

(declare-fun e!233304 () Bool)

(assert (=> d!106134 e!233304))

(declare-fun res!265876 () Bool)

(assert (=> d!106134 (=> (not res!265876) (not e!233304))))

(declare-datatypes ((Unit!22044 0))(
  ( (Unit!22045) )
))
(declare-datatypes ((tuple2!23738 0))(
  ( (tuple2!23739 (_1!13498 Unit!22044) (_2!13498 BitStream!14178)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14178) tuple2!23738)

(assert (=> d!106134 (= res!265876 (= (buf!8150 (_2!13498 (increaseBitIndex!0 thiss!1793))) (buf!8150 thiss!1793)))))

(declare-fun lt!446329 () Bool)

(assert (=> d!106134 (= lt!446329 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 thiss!1793)) (currentByte!15027 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446335 () tuple2!23728)

(assert (=> d!106134 (= lt!446335 (tuple2!23729 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 thiss!1793)) (currentByte!15027 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 thiss!1793)))) #b00000000000000000000000000000000)) (_2!13498 (increaseBitIndex!0 thiss!1793))))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!106134 (validate_offset_bit!0 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793)))))

(assert (=> d!106134 (= (readBit!0 thiss!1793) lt!446335)))

(declare-fun lt!446334 () (_ BitVec 64))

(declare-fun b!323872 () Bool)

(declare-fun lt!446332 () (_ BitVec 64))

(assert (=> b!323872 (= e!233304 (= (bitIndex!0 (size!9008 (buf!8150 (_2!13498 (increaseBitIndex!0 thiss!1793)))) (currentByte!15027 (_2!13498 (increaseBitIndex!0 thiss!1793))) (currentBit!15022 (_2!13498 (increaseBitIndex!0 thiss!1793)))) (bvadd lt!446334 lt!446332)))))

(assert (=> b!323872 (or (not (= (bvand lt!446334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446332 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446334 lt!446332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323872 (= lt!446332 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323872 (= lt!446334 (bitIndex!0 (size!9008 (buf!8150 thiss!1793)) (currentByte!15027 thiss!1793) (currentBit!15022 thiss!1793)))))

(declare-fun lt!446333 () Bool)

(assert (=> b!323872 (= lt!446333 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 thiss!1793)) (currentByte!15027 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446330 () Bool)

(assert (=> b!323872 (= lt!446330 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 thiss!1793)) (currentByte!15027 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 thiss!1793)))) #b00000000000000000000000000000000)))))

(declare-fun lt!446331 () Bool)

(assert (=> b!323872 (= lt!446331 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 thiss!1793)) (currentByte!15027 thiss!1793))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 thiss!1793)))) #b00000000000000000000000000000000)))))

(assert (= (and d!106134 res!265876) b!323872))

(declare-fun m!461851 () Bool)

(assert (=> d!106134 m!461851))

(declare-fun m!461853 () Bool)

(assert (=> d!106134 m!461853))

(declare-fun m!461855 () Bool)

(assert (=> d!106134 m!461855))

(declare-fun m!461857 () Bool)

(assert (=> d!106134 m!461857))

(assert (=> b!323872 m!461851))

(assert (=> b!323872 m!461853))

(assert (=> b!323872 m!461855))

(assert (=> b!323872 m!461773))

(declare-fun m!461859 () Bool)

(assert (=> b!323872 m!461859))

(assert (=> b!323770 d!106134))

(declare-fun d!106150 () Bool)

(assert (=> d!106150 (= (array_inv!8560 (buf!8150 thiss!1793)) (bvsge (size!9008 (buf!8150 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!323775 d!106150))

(declare-fun d!106152 () Bool)

(assert (=> d!106152 (= (inv!12 thiss!1793) (invariant!0 (currentBit!15022 thiss!1793) (currentByte!15027 thiss!1793) (size!9008 (buf!8150 thiss!1793))))))

(declare-fun bs!27964 () Bool)

(assert (= bs!27964 d!106152))

(assert (=> bs!27964 m!461817))

(assert (=> start!72202 d!106152))

(declare-fun d!106154 () Bool)

(declare-fun lt!446345 () tuple2!23728)

(assert (=> d!106154 (= lt!446345 (readBit!0 thiss!1793))))

(assert (=> d!106154 (= (readBitPure!0 thiss!1793) (tuple2!23731 (_2!13493 lt!446345) (_1!13493 lt!446345)))))

(declare-fun bs!27966 () Bool)

(assert (= bs!27966 d!106154))

(assert (=> bs!27966 m!461779))

(assert (=> b!323774 d!106154))

(check-sat (not d!106116) (not d!106152) (not d!106118) (not b!323850) (not d!106154) (not b!323852) (not b!323872) (not b!323849) (not d!106110) (not b!323851) (not d!106134) (not b!323846))
(check-sat)
(get-model)

(declare-fun d!106174 () Bool)

(declare-fun lt!446412 () tuple2!23728)

(assert (=> d!106174 (= lt!446412 (readBit!0 (_2!13493 lt!446201)))))

(assert (=> d!106174 (= (readBitPure!0 (_2!13493 lt!446201)) (tuple2!23731 (_2!13493 lt!446412) (_1!13493 lt!446412)))))

(declare-fun bs!27969 () Bool)

(assert (= bs!27969 d!106174))

(assert (=> bs!27969 m!461821))

(assert (=> b!323846 d!106174))

(declare-fun d!106176 () Bool)

(assert (=> d!106176 (= (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793))) (bvsub (bvmul ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15027 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15022 thiss!1793)))))))

(assert (=> d!106118 d!106176))

(declare-fun d!106178 () Bool)

(assert (=> d!106178 (= (invariant!0 (currentBit!15022 thiss!1793) (currentByte!15027 thiss!1793) (size!9008 (buf!8150 thiss!1793))) (and (bvsge (currentBit!15022 thiss!1793) #b00000000000000000000000000000000) (bvslt (currentBit!15022 thiss!1793) #b00000000000000000000000000001000) (bvsge (currentByte!15027 thiss!1793) #b00000000000000000000000000000000) (or (bvslt (currentByte!15027 thiss!1793) (size!9008 (buf!8150 thiss!1793))) (and (= (currentBit!15022 thiss!1793) #b00000000000000000000000000000000) (= (currentByte!15027 thiss!1793) (size!9008 (buf!8150 thiss!1793)))))))))

(assert (=> d!106118 d!106178))

(assert (=> d!106154 d!106134))

(declare-fun d!106180 () Bool)

(declare-fun e!233328 () Bool)

(assert (=> d!106180 e!233328))

(declare-fun res!265909 () Bool)

(assert (=> d!106180 (=> (not res!265909) (not e!233328))))

(declare-fun lt!446426 () tuple2!23738)

(declare-fun lt!446423 () (_ BitVec 64))

(declare-fun lt!446427 () (_ BitVec 64))

(assert (=> d!106180 (= res!265909 (= (bvadd lt!446427 lt!446423) (bitIndex!0 (size!9008 (buf!8150 (_2!13498 lt!446426))) (currentByte!15027 (_2!13498 lt!446426)) (currentBit!15022 (_2!13498 lt!446426)))))))

(assert (=> d!106180 (or (not (= (bvand lt!446427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446423 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446427 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446427 lt!446423) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106180 (= lt!446423 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106180 (= lt!446427 (bitIndex!0 (size!9008 (buf!8150 thiss!1793)) (currentByte!15027 thiss!1793) (currentBit!15022 thiss!1793)))))

(declare-fun Unit!22050 () Unit!22044)

(declare-fun Unit!22051 () Unit!22044)

(assert (=> d!106180 (= lt!446426 (ite (bvslt (currentBit!15022 thiss!1793) #b00000000000000000000000000000111) (tuple2!23739 Unit!22050 (BitStream!14179 (buf!8150 thiss!1793) (currentByte!15027 thiss!1793) (bvadd (currentBit!15022 thiss!1793) #b00000000000000000000000000000001))) (tuple2!23739 Unit!22051 (BitStream!14179 (buf!8150 thiss!1793) (bvadd (currentByte!15027 thiss!1793) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106180 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106180 (= (increaseBitIndex!0 thiss!1793) lt!446426)))

(declare-fun b!323910 () Bool)

(declare-fun res!265908 () Bool)

(assert (=> b!323910 (=> (not res!265908) (not e!233328))))

(declare-fun lt!446424 () (_ BitVec 64))

(declare-fun lt!446425 () (_ BitVec 64))

(assert (=> b!323910 (= res!265908 (= (bvsub lt!446424 lt!446425) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!323910 (or (= (bvand lt!446424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446425 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446424 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446424 lt!446425) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323910 (= lt!446425 (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13498 lt!446426)))) ((_ sign_extend 32) (currentByte!15027 (_2!13498 lt!446426))) ((_ sign_extend 32) (currentBit!15022 (_2!13498 lt!446426)))))))

(assert (=> b!323910 (= lt!446424 (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793))))))

(declare-fun b!323911 () Bool)

(assert (=> b!323911 (= e!233328 (= (size!9008 (buf!8150 thiss!1793)) (size!9008 (buf!8150 (_2!13498 lt!446426)))))))

(assert (= (and d!106180 res!265909) b!323910))

(assert (= (and b!323910 res!265908) b!323911))

(declare-fun m!461901 () Bool)

(assert (=> d!106180 m!461901))

(assert (=> d!106180 m!461773))

(assert (=> d!106180 m!461811))

(declare-fun m!461903 () Bool)

(assert (=> b!323910 m!461903))

(assert (=> b!323910 m!461811))

(assert (=> d!106134 d!106180))

(declare-fun d!106182 () Bool)

(assert (=> d!106182 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 thiss!1793))) ((_ sign_extend 32) (currentByte!15027 thiss!1793)) ((_ sign_extend 32) (currentBit!15022 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!27970 () Bool)

(assert (= bs!27970 d!106182))

(assert (=> bs!27970 m!461811))

(assert (=> d!106134 d!106182))

(declare-fun d!106184 () Bool)

(declare-fun e!233329 () Bool)

(assert (=> d!106184 e!233329))

(declare-fun res!265911 () Bool)

(assert (=> d!106184 (=> (not res!265911) (not e!233329))))

(declare-fun lt!446432 () (_ BitVec 64))

(declare-fun lt!446430 () (_ BitVec 64))

(declare-fun lt!446431 () (_ BitVec 64))

(assert (=> d!106184 (= res!265911 (= lt!446430 (bvsub lt!446431 lt!446432)))))

(assert (=> d!106184 (or (= (bvand lt!446431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446432 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446431 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446431 lt!446432) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106184 (= lt!446432 (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13498 (increaseBitIndex!0 thiss!1793))))) ((_ sign_extend 32) (currentByte!15027 (_2!13498 (increaseBitIndex!0 thiss!1793)))) ((_ sign_extend 32) (currentBit!15022 (_2!13498 (increaseBitIndex!0 thiss!1793))))))))

(declare-fun lt!446429 () (_ BitVec 64))

(declare-fun lt!446433 () (_ BitVec 64))

(assert (=> d!106184 (= lt!446431 (bvmul lt!446429 lt!446433))))

(assert (=> d!106184 (or (= lt!446429 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446433 (bvsdiv (bvmul lt!446429 lt!446433) lt!446429)))))

(assert (=> d!106184 (= lt!446433 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106184 (= lt!446429 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13498 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!106184 (= lt!446430 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15027 (_2!13498 (increaseBitIndex!0 thiss!1793)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15022 (_2!13498 (increaseBitIndex!0 thiss!1793))))))))

(assert (=> d!106184 (invariant!0 (currentBit!15022 (_2!13498 (increaseBitIndex!0 thiss!1793))) (currentByte!15027 (_2!13498 (increaseBitIndex!0 thiss!1793))) (size!9008 (buf!8150 (_2!13498 (increaseBitIndex!0 thiss!1793)))))))

(assert (=> d!106184 (= (bitIndex!0 (size!9008 (buf!8150 (_2!13498 (increaseBitIndex!0 thiss!1793)))) (currentByte!15027 (_2!13498 (increaseBitIndex!0 thiss!1793))) (currentBit!15022 (_2!13498 (increaseBitIndex!0 thiss!1793)))) lt!446430)))

(declare-fun b!323912 () Bool)

(declare-fun res!265910 () Bool)

(assert (=> b!323912 (=> (not res!265910) (not e!233329))))

(assert (=> b!323912 (= res!265910 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446430))))

(declare-fun b!323913 () Bool)

(declare-fun lt!446428 () (_ BitVec 64))

(assert (=> b!323913 (= e!233329 (bvsle lt!446430 (bvmul lt!446428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323913 (or (= lt!446428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446428)))))

(assert (=> b!323913 (= lt!446428 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13498 (increaseBitIndex!0 thiss!1793))))))))

(assert (= (and d!106184 res!265911) b!323912))

(assert (= (and b!323912 res!265910) b!323913))

(declare-fun m!461905 () Bool)

(assert (=> d!106184 m!461905))

(declare-fun m!461907 () Bool)

(assert (=> d!106184 m!461907))

(assert (=> b!323872 d!106184))

(assert (=> b!323872 d!106180))

(assert (=> b!323872 d!106118))

(declare-fun d!106186 () Bool)

(assert (=> d!106186 (= (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13492 lt!446199)))) ((_ sign_extend 32) (currentByte!15027 (_2!13492 lt!446199))) ((_ sign_extend 32) (currentBit!15022 (_2!13492 lt!446199)))) (bvsub (bvmul ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13492 lt!446199)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15027 (_2!13492 lt!446199))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15022 (_2!13492 lt!446199))))))))

(assert (=> d!106116 d!106186))

(declare-fun d!106188 () Bool)

(assert (=> d!106188 (= (invariant!0 (currentBit!15022 (_2!13492 lt!446199)) (currentByte!15027 (_2!13492 lt!446199)) (size!9008 (buf!8150 (_2!13492 lt!446199)))) (and (bvsge (currentBit!15022 (_2!13492 lt!446199)) #b00000000000000000000000000000000) (bvslt (currentBit!15022 (_2!13492 lt!446199)) #b00000000000000000000000000001000) (bvsge (currentByte!15027 (_2!13492 lt!446199)) #b00000000000000000000000000000000) (or (bvslt (currentByte!15027 (_2!13492 lt!446199)) (size!9008 (buf!8150 (_2!13492 lt!446199)))) (and (= (currentBit!15022 (_2!13492 lt!446199)) #b00000000000000000000000000000000) (= (currentByte!15027 (_2!13492 lt!446199)) (size!9008 (buf!8150 (_2!13492 lt!446199))))))))))

(assert (=> d!106116 d!106188))

(declare-fun d!106190 () Bool)

(declare-fun e!233330 () Bool)

(assert (=> d!106190 e!233330))

(declare-fun res!265913 () Bool)

(assert (=> d!106190 (=> (not res!265913) (not e!233330))))

(declare-fun lt!446437 () (_ BitVec 64))

(declare-fun lt!446436 () (_ BitVec 64))

(declare-fun lt!446438 () (_ BitVec 64))

(assert (=> d!106190 (= res!265913 (= lt!446436 (bvsub lt!446437 lt!446438)))))

(assert (=> d!106190 (or (= (bvand lt!446437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446438 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446437 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446437 lt!446438) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106190 (= lt!446438 (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13492 lt!446267)))) ((_ sign_extend 32) (currentByte!15027 (_2!13492 lt!446267))) ((_ sign_extend 32) (currentBit!15022 (_2!13492 lt!446267)))))))

(declare-fun lt!446435 () (_ BitVec 64))

(declare-fun lt!446439 () (_ BitVec 64))

(assert (=> d!106190 (= lt!446437 (bvmul lt!446435 lt!446439))))

(assert (=> d!106190 (or (= lt!446435 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446439 (bvsdiv (bvmul lt!446435 lt!446439) lt!446435)))))

(assert (=> d!106190 (= lt!446439 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106190 (= lt!446435 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13492 lt!446267)))))))

(assert (=> d!106190 (= lt!446436 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15027 (_2!13492 lt!446267))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15022 (_2!13492 lt!446267)))))))

(assert (=> d!106190 (invariant!0 (currentBit!15022 (_2!13492 lt!446267)) (currentByte!15027 (_2!13492 lt!446267)) (size!9008 (buf!8150 (_2!13492 lt!446267))))))

(assert (=> d!106190 (= (bitIndex!0 (size!9008 (buf!8150 (_2!13492 lt!446267))) (currentByte!15027 (_2!13492 lt!446267)) (currentBit!15022 (_2!13492 lt!446267))) lt!446436)))

(declare-fun b!323914 () Bool)

(declare-fun res!265912 () Bool)

(assert (=> b!323914 (=> (not res!265912) (not e!233330))))

(assert (=> b!323914 (= res!265912 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446436))))

(declare-fun b!323915 () Bool)

(declare-fun lt!446434 () (_ BitVec 64))

(assert (=> b!323915 (= e!233330 (bvsle lt!446436 (bvmul lt!446434 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323915 (or (= lt!446434 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446434 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446434)))))

(assert (=> b!323915 (= lt!446434 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13492 lt!446267)))))))

(assert (= (and d!106190 res!265913) b!323914))

(assert (= (and b!323914 res!265912) b!323915))

(declare-fun m!461909 () Bool)

(assert (=> d!106190 m!461909))

(declare-fun m!461911 () Bool)

(assert (=> d!106190 m!461911))

(assert (=> b!323852 d!106190))

(declare-fun d!106192 () Bool)

(declare-fun e!233331 () Bool)

(assert (=> d!106192 e!233331))

(declare-fun res!265915 () Bool)

(assert (=> d!106192 (=> (not res!265915) (not e!233331))))

(declare-fun lt!446442 () (_ BitVec 64))

(declare-fun lt!446444 () (_ BitVec 64))

(declare-fun lt!446443 () (_ BitVec 64))

(assert (=> d!106192 (= res!265915 (= lt!446442 (bvsub lt!446443 lt!446444)))))

(assert (=> d!106192 (or (= (bvand lt!446443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446444 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446443 lt!446444) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106192 (= lt!446444 (remainingBits!0 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13493 lt!446201)))) ((_ sign_extend 32) (currentByte!15027 (_2!13493 lt!446201))) ((_ sign_extend 32) (currentBit!15022 (_2!13493 lt!446201)))))))

(declare-fun lt!446441 () (_ BitVec 64))

(declare-fun lt!446445 () (_ BitVec 64))

(assert (=> d!106192 (= lt!446443 (bvmul lt!446441 lt!446445))))

(assert (=> d!106192 (or (= lt!446441 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446445 (bvsdiv (bvmul lt!446441 lt!446445) lt!446441)))))

(assert (=> d!106192 (= lt!446445 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106192 (= lt!446441 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13493 lt!446201)))))))

(assert (=> d!106192 (= lt!446442 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15027 (_2!13493 lt!446201))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15022 (_2!13493 lt!446201)))))))

(assert (=> d!106192 (invariant!0 (currentBit!15022 (_2!13493 lt!446201)) (currentByte!15027 (_2!13493 lt!446201)) (size!9008 (buf!8150 (_2!13493 lt!446201))))))

(assert (=> d!106192 (= (bitIndex!0 (size!9008 (buf!8150 (_2!13493 lt!446201))) (currentByte!15027 (_2!13493 lt!446201)) (currentBit!15022 (_2!13493 lt!446201))) lt!446442)))

(declare-fun b!323916 () Bool)

(declare-fun res!265914 () Bool)

(assert (=> b!323916 (=> (not res!265914) (not e!233331))))

(assert (=> b!323916 (= res!265914 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446442))))

(declare-fun b!323917 () Bool)

(declare-fun lt!446440 () (_ BitVec 64))

(assert (=> b!323917 (= e!233331 (bvsle lt!446442 (bvmul lt!446440 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323917 (or (= lt!446440 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446440 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446440)))))

(assert (=> b!323917 (= lt!446440 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13493 lt!446201)))))))

(assert (= (and d!106192 res!265915) b!323916))

(assert (= (and b!323916 res!265914) b!323917))

(declare-fun m!461913 () Bool)

(assert (=> d!106192 m!461913))

(declare-fun m!461915 () Bool)

(assert (=> d!106192 m!461915))

(assert (=> b!323852 d!106192))

(declare-fun d!106194 () Bool)

(declare-fun e!233332 () Bool)

(assert (=> d!106194 e!233332))

(declare-fun res!265916 () Bool)

(assert (=> d!106194 (=> (not res!265916) (not e!233332))))

(assert (=> d!106194 (= res!265916 (= (buf!8150 (_2!13498 (increaseBitIndex!0 (_2!13493 lt!446201)))) (buf!8150 (_2!13493 lt!446201))))))

(declare-fun lt!446446 () Bool)

(assert (=> d!106194 (= lt!446446 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 (_2!13493 lt!446201))) (currentByte!15027 (_2!13493 lt!446201)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 (_2!13493 lt!446201))))) #b00000000000000000000000000000000)))))

(declare-fun lt!446452 () tuple2!23728)

(assert (=> d!106194 (= lt!446452 (tuple2!23729 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 (_2!13493 lt!446201))) (currentByte!15027 (_2!13493 lt!446201)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 (_2!13493 lt!446201))))) #b00000000000000000000000000000000)) (_2!13498 (increaseBitIndex!0 (_2!13493 lt!446201)))))))

(assert (=> d!106194 (validate_offset_bit!0 ((_ sign_extend 32) (size!9008 (buf!8150 (_2!13493 lt!446201)))) ((_ sign_extend 32) (currentByte!15027 (_2!13493 lt!446201))) ((_ sign_extend 32) (currentBit!15022 (_2!13493 lt!446201))))))

(assert (=> d!106194 (= (readBit!0 (_2!13493 lt!446201)) lt!446452)))

(declare-fun b!323918 () Bool)

(declare-fun lt!446451 () (_ BitVec 64))

(declare-fun lt!446449 () (_ BitVec 64))

(assert (=> b!323918 (= e!233332 (= (bitIndex!0 (size!9008 (buf!8150 (_2!13498 (increaseBitIndex!0 (_2!13493 lt!446201))))) (currentByte!15027 (_2!13498 (increaseBitIndex!0 (_2!13493 lt!446201)))) (currentBit!15022 (_2!13498 (increaseBitIndex!0 (_2!13493 lt!446201))))) (bvadd lt!446451 lt!446449)))))

(assert (=> b!323918 (or (not (= (bvand lt!446451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446449 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446451 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446451 lt!446449) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323918 (= lt!446449 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!323918 (= lt!446451 (bitIndex!0 (size!9008 (buf!8150 (_2!13493 lt!446201))) (currentByte!15027 (_2!13493 lt!446201)) (currentBit!15022 (_2!13493 lt!446201))))))

(declare-fun lt!446450 () Bool)

(assert (=> b!323918 (= lt!446450 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 (_2!13493 lt!446201))) (currentByte!15027 (_2!13493 lt!446201)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 (_2!13493 lt!446201))))) #b00000000000000000000000000000000)))))

(declare-fun lt!446447 () Bool)

(assert (=> b!323918 (= lt!446447 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 (_2!13493 lt!446201))) (currentByte!15027 (_2!13493 lt!446201)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 (_2!13493 lt!446201))))) #b00000000000000000000000000000000)))))

(declare-fun lt!446448 () Bool)

(assert (=> b!323918 (= lt!446448 (not (= (bvand ((_ sign_extend 24) (select (arr!10100 (buf!8150 (_2!13493 lt!446201))) (currentByte!15027 (_2!13493 lt!446201)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!15022 (_2!13493 lt!446201))))) #b00000000000000000000000000000000)))))

(assert (= (and d!106194 res!265916) b!323918))

(declare-fun m!461917 () Bool)

(assert (=> d!106194 m!461917))

(declare-fun m!461919 () Bool)

(assert (=> d!106194 m!461919))

(declare-fun m!461921 () Bool)

(assert (=> d!106194 m!461921))

(declare-fun m!461923 () Bool)

(assert (=> d!106194 m!461923))

(assert (=> b!323918 m!461917))

(assert (=> b!323918 m!461919))

(assert (=> b!323918 m!461921))

(assert (=> b!323918 m!461829))

(declare-fun m!461925 () Bool)

(assert (=> b!323918 m!461925))

(assert (=> b!323851 d!106194))

(declare-fun b!323919 () Bool)

(declare-fun e!233333 () Bool)

(declare-fun lt!446453 () (_ BitVec 64))

(declare-fun lt!446458 () tuple2!23726)

(assert (=> b!323919 (= e!233333 (= (= (bvand (bvlshr (_1!13492 lt!446458) lt!446453) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000000001) (_2!13494 (readBitPure!0 (_2!13493 lt!446264)))))))

(assert (=> b!323919 (and (bvsge lt!446453 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle lt!446453 #b0000000000000000000000000000000000000000000000000000000001000000))))

(assert (=> b!323919 (= lt!446453 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))

(declare-fun e!233335 () tuple2!23726)

(declare-fun b!323920 () Bool)

(assert (=> b!323920 (= e!233335 (tuple2!23727 (bvor (bvor acc!161 (ite (_1!13493 lt!446201) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13493 lt!446264) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (_2!13493 lt!446264)))))

(declare-fun b!323921 () Bool)

(declare-fun e!233334 () Bool)

(assert (=> b!323921 (= e!233334 e!233333)))

(declare-fun res!265920 () Bool)

(assert (=> b!323921 (=> res!265920 e!233333)))

(assert (=> b!323921 (= res!265920 (not (bvslt (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) nBits!548)))))

(declare-fun b!323922 () Bool)

(declare-fun res!265919 () Bool)

(assert (=> b!323922 (=> (not res!265919) (not e!233334))))

(assert (=> b!323922 (= res!265919 (= (bvand (_1!13492 lt!446458) (onesLSBLong!0 nBits!548)) (_1!13492 lt!446458)))))

(declare-fun d!106196 () Bool)

(assert (=> d!106196 e!233334))

(declare-fun res!265921 () Bool)

(assert (=> d!106196 (=> (not res!265921) (not e!233334))))

(assert (=> d!106196 (= res!265921 (= (buf!8150 (_2!13492 lt!446458)) (buf!8150 (_2!13493 lt!446264))))))

(assert (=> d!106196 (= lt!446458 e!233335)))

(declare-fun c!15461 () Bool)

(assert (=> d!106196 (= c!15461 (= nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))

(assert (=> d!106196 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)) (bvsle (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000))))

(assert (=> d!106196 (= (readNBitsLSBFirstsLoop!0 (_2!13493 lt!446264) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) (bvor (bvor acc!161 (ite (_1!13493 lt!446201) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13493 lt!446264) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))) lt!446458)))

(declare-fun b!323923 () Bool)

(declare-fun res!265917 () Bool)

(assert (=> b!323923 (=> (not res!265917) (not e!233334))))

(assert (=> b!323923 (= res!265917 (= (bvand (_1!13492 lt!446458) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))) (bvand (bvor (bvor acc!161 (ite (_1!13493 lt!446201) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13493 lt!446264) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)))))))

(declare-fun b!323924 () Bool)

(declare-fun lt!446454 () tuple2!23726)

(assert (=> b!323924 (= e!233335 (tuple2!23727 (_1!13492 lt!446454) (_2!13492 lt!446454)))))

(declare-fun lt!446455 () tuple2!23728)

(assert (=> b!323924 (= lt!446455 (readBit!0 (_2!13493 lt!446264)))))

(assert (=> b!323924 (= lt!446454 (readNBitsLSBFirstsLoop!0 (_2!13493 lt!446455) nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvor (bvor (bvor acc!161 (ite (_1!13493 lt!446201) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!743)) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13493 lt!446264) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000)) (ite (_1!13493 lt!446455) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!323925 () Bool)

(declare-fun res!265918 () Bool)

(assert (=> b!323925 (=> (not res!265918) (not e!233334))))

(declare-fun lt!446457 () (_ BitVec 64))

(declare-fun lt!446456 () (_ BitVec 64))

(assert (=> b!323925 (= res!265918 (= (bitIndex!0 (size!9008 (buf!8150 (_2!13492 lt!446458))) (currentByte!15027 (_2!13492 lt!446458)) (currentBit!15022 (_2!13492 lt!446458))) (bvadd lt!446457 lt!446456)))))

(assert (=> b!323925 (or (not (= (bvand lt!446457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446456 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446457 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446457 lt!446456) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!323925 (= lt!446456 ((_ sign_extend 32) (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001))))))

(assert (=> b!323925 (or (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001) #b10000000000000000000000000000000)) (= (bvand nBits!548 #b10000000000000000000000000000000) (bvand (bvsub nBits!548 (bvadd #b00000000000000000000000000000001 i!743 #b00000000000000000000000000000001)) #b10000000000000000000000000000000)))))

(assert (=> b!323925 (= lt!446457 (bitIndex!0 (size!9008 (buf!8150 (_2!13493 lt!446264))) (currentByte!15027 (_2!13493 lt!446264)) (currentBit!15022 (_2!13493 lt!446264))))))

(assert (= (and d!106196 c!15461) b!323920))

(assert (= (and d!106196 (not c!15461)) b!323924))

(assert (= (and d!106196 res!265921) b!323925))

(assert (= (and b!323925 res!265918) b!323923))

(assert (= (and b!323923 res!265917) b!323922))

(assert (= (and b!323922 res!265919) b!323921))

(assert (= (and b!323921 (not res!265920)) b!323919))

(declare-fun m!461927 () Bool)

(assert (=> b!323924 m!461927))

(declare-fun m!461929 () Bool)

(assert (=> b!323924 m!461929))

(declare-fun m!461931 () Bool)

(assert (=> b!323923 m!461931))

(declare-fun m!461933 () Bool)

(assert (=> b!323925 m!461933))

(declare-fun m!461935 () Bool)

(assert (=> b!323925 m!461935))

(declare-fun m!461937 () Bool)

(assert (=> b!323919 m!461937))

(assert (=> b!323922 m!461787))

(assert (=> b!323851 d!106196))

(assert (=> d!106152 d!106178))

(declare-fun d!106198 () Bool)

(assert (=> d!106198 (= (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!743)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvadd #b00000000000000000000000000000001 i!743)))))))

(assert (=> b!323850 d!106198))

(assert (=> b!323849 d!106112))

(assert (=> d!106110 d!106176))

(check-sat (not b!323925) (not d!106194) (not d!106174) (not d!106192) (not b!323919) (not b!323923) (not b!323924) (not b!323922) (not b!323910) (not d!106180) (not d!106184) (not b!323918) (not d!106182) (not d!106190))
(check-sat)
