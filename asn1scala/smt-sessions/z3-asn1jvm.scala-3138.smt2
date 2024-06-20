; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72082 () Bool)

(assert start!72082)

(declare-fun b!323255 () Bool)

(declare-fun e!232905 () Bool)

(declare-fun e!232901 () Bool)

(assert (=> b!323255 (= e!232905 e!232901)))

(declare-fun res!265356 () Bool)

(assert (=> b!323255 (=> (not res!265356) (not e!232901))))

(declare-datatypes ((array!20646 0))(
  ( (array!20647 (arr!10079 (Array (_ BitVec 32) (_ BitVec 8))) (size!8987 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14136 0))(
  ( (BitStream!14137 (buf!8129 array!20646) (currentByte!14994 (_ BitVec 32)) (currentBit!14989 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14136)

(declare-fun lt!445838 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323255 (= res!265356 (validate_offset_bits!1 ((_ sign_extend 32) (size!8987 (buf!8129 thiss!1793))) ((_ sign_extend 32) (currentByte!14994 thiss!1793)) ((_ sign_extend 32) (currentBit!14989 thiss!1793)) lt!445838))))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-fun i!743 () (_ BitVec 32))

(assert (=> b!323255 (= lt!445838 ((_ sign_extend 32) (bvsub nBits!548 i!743)))))

(declare-fun b!323256 () Bool)

(declare-fun e!232903 () Bool)

(declare-fun array_inv!8539 (array!20646) Bool)

(assert (=> b!323256 (= e!232903 (array_inv!8539 (buf!8129 thiss!1793)))))

(declare-fun b!323257 () Bool)

(declare-fun e!232904 () Bool)

(assert (=> b!323257 (= e!232901 e!232904)))

(declare-fun res!265358 () Bool)

(assert (=> b!323257 (=> res!265358 e!232904)))

(declare-fun lt!445837 () (_ BitVec 64))

(assert (=> b!323257 (= res!265358 (not (= lt!445837 (bvadd lt!445837 lt!445838))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323257 (= lt!445837 (bitIndex!0 (size!8987 (buf!8129 thiss!1793)) (currentByte!14994 thiss!1793) (currentBit!14989 thiss!1793)))))

(declare-fun b!323258 () Bool)

(declare-fun res!265360 () Bool)

(assert (=> b!323258 (=> (not res!265360) (not e!232901))))

(declare-fun acc!161 () (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323258 (= res!265360 (= (bvand acc!161 (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!323259 () Bool)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!323259 (= e!232904 (not (= (bvand acc!161 (onesLSBLong!0 nBits!548)) acc!161)))))

(declare-fun res!265357 () Bool)

(assert (=> start!72082 (=> (not res!265357) (not e!232905))))

(assert (=> start!72082 (= res!265357 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72082 e!232905))

(assert (=> start!72082 true))

(declare-fun inv!12 (BitStream!14136) Bool)

(assert (=> start!72082 (and (inv!12 thiss!1793) e!232903)))

(declare-fun b!323260 () Bool)

(declare-fun res!265359 () Bool)

(assert (=> b!323260 (=> (not res!265359) (not e!232901))))

(assert (=> b!323260 (= res!265359 (and (= (bvand acc!161 #b1111111111111111111111111111111111111111111111111111111111111111) acc!161) (= nBits!548 i!743)))))

(assert (= (and start!72082 res!265357) b!323255))

(assert (= (and b!323255 res!265356) b!323258))

(assert (= (and b!323258 res!265360) b!323260))

(assert (= (and b!323260 res!265359) b!323257))

(assert (= (and b!323257 (not res!265358)) b!323259))

(assert (= start!72082 b!323256))

(declare-fun m!461391 () Bool)

(assert (=> b!323256 m!461391))

(declare-fun m!461393 () Bool)

(assert (=> b!323258 m!461393))

(declare-fun m!461395 () Bool)

(assert (=> b!323259 m!461395))

(declare-fun m!461397 () Bool)

(assert (=> b!323257 m!461397))

(declare-fun m!461399 () Bool)

(assert (=> start!72082 m!461399))

(declare-fun m!461401 () Bool)

(assert (=> b!323255 m!461401))

(check-sat (not start!72082) (not b!323257) (not b!323258) (not b!323255) (not b!323256) (not b!323259))
(check-sat)
(get-model)

(declare-fun d!106016 () Bool)

(assert (=> d!106016 (= (array_inv!8539 (buf!8129 thiss!1793)) (bvsge (size!8987 (buf!8129 thiss!1793)) #b00000000000000000000000000000000))))

(assert (=> b!323256 d!106016))

(declare-fun d!106018 () Bool)

(declare-fun e!232923 () Bool)

(assert (=> d!106018 e!232923))

(declare-fun res!265380 () Bool)

(assert (=> d!106018 (=> (not res!265380) (not e!232923))))

(declare-fun lt!445861 () (_ BitVec 64))

(declare-fun lt!445859 () (_ BitVec 64))

(declare-fun lt!445857 () (_ BitVec 64))

(assert (=> d!106018 (= res!265380 (= lt!445859 (bvsub lt!445861 lt!445857)))))

(assert (=> d!106018 (or (= (bvand lt!445861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!445857 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!445861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!445861 lt!445857) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106018 (= lt!445857 (remainingBits!0 ((_ sign_extend 32) (size!8987 (buf!8129 thiss!1793))) ((_ sign_extend 32) (currentByte!14994 thiss!1793)) ((_ sign_extend 32) (currentBit!14989 thiss!1793))))))

(declare-fun lt!445860 () (_ BitVec 64))

(declare-fun lt!445858 () (_ BitVec 64))

(assert (=> d!106018 (= lt!445861 (bvmul lt!445860 lt!445858))))

(assert (=> d!106018 (or (= lt!445860 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!445858 (bvsdiv (bvmul lt!445860 lt!445858) lt!445860)))))

(assert (=> d!106018 (= lt!445858 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106018 (= lt!445860 ((_ sign_extend 32) (size!8987 (buf!8129 thiss!1793))))))

(assert (=> d!106018 (= lt!445859 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14994 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14989 thiss!1793))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106018 (invariant!0 (currentBit!14989 thiss!1793) (currentByte!14994 thiss!1793) (size!8987 (buf!8129 thiss!1793)))))

(assert (=> d!106018 (= (bitIndex!0 (size!8987 (buf!8129 thiss!1793)) (currentByte!14994 thiss!1793) (currentBit!14989 thiss!1793)) lt!445859)))

(declare-fun b!323283 () Bool)

(declare-fun res!265381 () Bool)

(assert (=> b!323283 (=> (not res!265381) (not e!232923))))

(assert (=> b!323283 (= res!265381 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!445859))))

(declare-fun b!323284 () Bool)

(declare-fun lt!445862 () (_ BitVec 64))

(assert (=> b!323284 (= e!232923 (bvsle lt!445859 (bvmul lt!445862 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!323284 (or (= lt!445862 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!445862 #b0000000000000000000000000000000000000000000000000000000000001000) lt!445862)))))

(assert (=> b!323284 (= lt!445862 ((_ sign_extend 32) (size!8987 (buf!8129 thiss!1793))))))

(assert (= (and d!106018 res!265380) b!323283))

(assert (= (and b!323283 res!265381) b!323284))

(declare-fun m!461419 () Bool)

(assert (=> d!106018 m!461419))

(declare-fun m!461421 () Bool)

(assert (=> d!106018 m!461421))

(assert (=> b!323257 d!106018))

(declare-fun d!106032 () Bool)

(assert (=> d!106032 (= (onesLSBLong!0 nBits!548) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!548))))))

(assert (=> b!323259 d!106032))

(declare-fun d!106034 () Bool)

(assert (=> d!106034 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!743)) (ite (= (bvsub #b00000000000000000000000001000000 i!743) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!743))))))))

(assert (=> b!323258 d!106034))

(declare-fun d!106036 () Bool)

(assert (=> d!106036 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8987 (buf!8129 thiss!1793))) ((_ sign_extend 32) (currentByte!14994 thiss!1793)) ((_ sign_extend 32) (currentBit!14989 thiss!1793)) lt!445838) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8987 (buf!8129 thiss!1793))) ((_ sign_extend 32) (currentByte!14994 thiss!1793)) ((_ sign_extend 32) (currentBit!14989 thiss!1793))) lt!445838))))

(declare-fun bs!27929 () Bool)

(assert (= bs!27929 d!106036))

(assert (=> bs!27929 m!461419))

(assert (=> b!323255 d!106036))

(declare-fun d!106038 () Bool)

(assert (=> d!106038 (= (inv!12 thiss!1793) (invariant!0 (currentBit!14989 thiss!1793) (currentByte!14994 thiss!1793) (size!8987 (buf!8129 thiss!1793))))))

(declare-fun bs!27930 () Bool)

(assert (= bs!27930 d!106038))

(assert (=> bs!27930 m!461421))

(assert (=> start!72082 d!106038))

(check-sat (not d!106038) (not d!106036) (not d!106018))
