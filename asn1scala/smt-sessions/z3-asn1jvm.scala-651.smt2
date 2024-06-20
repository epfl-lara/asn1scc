; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18186 () Bool)

(assert start!18186)

(declare-fun b!90008 () Bool)

(declare-fun res!74196 () Bool)

(declare-fun e!59369 () Bool)

(assert (=> b!90008 (=> (not res!74196) (not e!59369))))

(declare-datatypes ((array!4235 0))(
  ( (array!4236 (arr!2548 (Array (_ BitVec 32) (_ BitVec 8))) (size!1911 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3384 0))(
  ( (BitStream!3385 (buf!2301 array!4235) (currentByte!4564 (_ BitVec 32)) (currentBit!4559 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3384)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!90008 (= res!74196 (invariant!0 (currentBit!4559 thiss!1151) (currentByte!4564 thiss!1151) (size!1911 (buf!2301 thiss!1151))))))

(declare-fun b!90009 () Bool)

(declare-fun res!74192 () Bool)

(declare-fun e!59372 () Bool)

(assert (=> b!90009 (=> (not res!74192) (not e!59372))))

(declare-fun thiss!1152 () BitStream!3384)

(declare-datatypes ((Unit!5808 0))(
  ( (Unit!5809) )
))
(declare-datatypes ((tuple2!7526 0))(
  ( (tuple2!7527 (_1!4003 Unit!5808) (_2!4003 BitStream!3384)) )
))
(declare-fun lt!136857 () tuple2!7526)

(declare-fun isPrefixOf!0 (BitStream!3384 BitStream!3384) Bool)

(assert (=> b!90009 (= res!74192 (isPrefixOf!0 thiss!1152 (_2!4003 lt!136857)))))

(declare-fun b!90010 () Bool)

(declare-fun e!59368 () Bool)

(declare-datatypes ((tuple3!432 0))(
  ( (tuple3!433 (_1!4004 Unit!5808) (_2!4004 BitStream!3384) (_3!240 (_ BitVec 32))) )
))
(declare-fun lt!136856 () tuple3!432)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90010 (= e!59368 (validate_offset_bits!1 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4004 lt!136856)))) ((_ sign_extend 32) (currentByte!4564 (_2!4004 lt!136856))) ((_ sign_extend 32) (currentBit!4559 (_2!4004 lt!136856))) ((_ sign_extend 32) (bvsub nBits!336 (_3!240 lt!136856)))))))

(declare-fun b!90011 () Bool)

(declare-fun res!74193 () Bool)

(assert (=> b!90011 (=> (not res!74193) (not e!59369))))

(assert (=> b!90011 (= res!74193 (validate_offset_bits!1 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1151))) ((_ sign_extend 32) (currentByte!4564 thiss!1151)) ((_ sign_extend 32) (currentBit!4559 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!90012 () Bool)

(declare-fun e!59367 () Bool)

(declare-datatypes ((tuple2!7528 0))(
  ( (tuple2!7529 (_1!4005 BitStream!3384) (_2!4005 Bool)) )
))
(declare-fun lt!136851 () tuple2!7528)

(declare-fun lt!136855 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!90012 (= e!59367 (= (bitIndex!0 (size!1911 (buf!2301 (_1!4005 lt!136851))) (currentByte!4564 (_1!4005 lt!136851)) (currentBit!4559 (_1!4005 lt!136851))) lt!136855))))

(declare-fun b!90014 () Bool)

(declare-fun res!74190 () Bool)

(assert (=> b!90014 (=> (not res!74190) (not e!59369))))

(assert (=> b!90014 (= res!74190 (invariant!0 (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152) (size!1911 (buf!2301 thiss!1152))))))

(declare-fun b!90015 () Bool)

(declare-fun res!74181 () Bool)

(assert (=> b!90015 (=> (not res!74181) (not e!59369))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!90015 (= res!74181 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!90016 () Bool)

(declare-fun res!74182 () Bool)

(assert (=> b!90016 (=> (not res!74182) (not e!59368))))

(declare-fun lt!136852 () (_ BitVec 64))

(assert (=> b!90016 (= res!74182 (= (bitIndex!0 (size!1911 (buf!2301 (_2!4004 lt!136856))) (currentByte!4564 (_2!4004 lt!136856)) (currentBit!4559 (_2!4004 lt!136856))) (bvadd lt!136852 ((_ sign_extend 32) (_3!240 lt!136856)))))))

(declare-fun b!90017 () Bool)

(declare-fun res!74188 () Bool)

(declare-fun e!59374 () Bool)

(assert (=> b!90017 (=> (not res!74188) (not e!59374))))

(assert (=> b!90017 (= res!74188 (validate_offset_bits!1 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1152))) ((_ sign_extend 32) (currentByte!4564 thiss!1152)) ((_ sign_extend 32) (currentBit!4559 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!90018 () Bool)

(assert (=> b!90018 (= e!59369 e!59374)))

(declare-fun res!74189 () Bool)

(assert (=> b!90018 (=> (not res!74189) (not e!59374))))

(declare-fun lt!136853 () (_ BitVec 64))

(assert (=> b!90018 (= res!74189 (= lt!136853 (bvadd lt!136852 ((_ sign_extend 32) i!576))))))

(assert (=> b!90018 (= lt!136853 (bitIndex!0 (size!1911 (buf!2301 thiss!1152)) (currentByte!4564 thiss!1152) (currentBit!4559 thiss!1152)))))

(assert (=> b!90018 (= lt!136852 (bitIndex!0 (size!1911 (buf!2301 thiss!1151)) (currentByte!4564 thiss!1151) (currentBit!4559 thiss!1151)))))

(declare-fun b!90019 () Bool)

(declare-fun res!74180 () Bool)

(assert (=> b!90019 (=> (not res!74180) (not e!59369))))

(assert (=> b!90019 (= res!74180 (and (bvsle i!576 nBits!336) (= (size!1911 (buf!2301 thiss!1152)) (size!1911 (buf!2301 thiss!1151)))))))

(declare-fun b!90020 () Bool)

(declare-fun res!74183 () Bool)

(declare-fun e!59373 () Bool)

(assert (=> b!90020 (=> res!74183 e!59373)))

(assert (=> b!90020 (= res!74183 (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!90021 () Bool)

(declare-fun res!74195 () Bool)

(assert (=> b!90021 (=> (not res!74195) (not e!59374))))

(assert (=> b!90021 (= res!74195 (bvslt i!576 nBits!336))))

(declare-fun b!90022 () Bool)

(declare-fun e!59370 () Bool)

(declare-fun array_inv!1757 (array!4235) Bool)

(assert (=> b!90022 (= e!59370 (array_inv!1757 (buf!2301 thiss!1152)))))

(declare-fun b!90023 () Bool)

(declare-fun res!74185 () Bool)

(assert (=> b!90023 (=> (not res!74185) (not e!59368))))

(assert (=> b!90023 (= res!74185 (and (bvsle (_3!240 lt!136856) nBits!336) (= (size!1911 (buf!2301 (_2!4004 lt!136856))) (size!1911 (buf!2301 thiss!1151)))))))

(declare-fun b!90024 () Bool)

(assert (=> b!90024 (= e!59372 e!59367)))

(declare-fun res!74191 () Bool)

(assert (=> b!90024 (=> (not res!74191) (not e!59367))))

(declare-fun lt!136854 () Bool)

(assert (=> b!90024 (= res!74191 (and (= (_2!4005 lt!136851) lt!136854) (= (_1!4005 lt!136851) (_2!4003 lt!136857))))))

(declare-fun readBitPure!0 (BitStream!3384) tuple2!7528)

(declare-fun readerFrom!0 (BitStream!3384 (_ BitVec 32) (_ BitVec 32)) BitStream!3384)

(assert (=> b!90024 (= lt!136851 (readBitPure!0 (readerFrom!0 (_2!4003 lt!136857) (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152))))))

(declare-fun b!90025 () Bool)

(declare-fun e!59366 () Bool)

(assert (=> b!90025 (= e!59366 e!59372)))

(declare-fun res!74194 () Bool)

(assert (=> b!90025 (=> (not res!74194) (not e!59372))))

(assert (=> b!90025 (= res!74194 (= lt!136855 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136853)))))

(assert (=> b!90025 (= lt!136855 (bitIndex!0 (size!1911 (buf!2301 (_2!4003 lt!136857))) (currentByte!4564 (_2!4003 lt!136857)) (currentBit!4559 (_2!4003 lt!136857))))))

(declare-fun b!90026 () Bool)

(declare-fun e!59376 () Bool)

(assert (=> b!90026 (= e!59376 (array_inv!1757 (buf!2301 thiss!1151)))))

(declare-fun b!90013 () Bool)

(declare-fun res!74179 () Bool)

(assert (=> b!90013 (=> (not res!74179) (not e!59368))))

(assert (=> b!90013 (= res!74179 (invariant!0 (currentBit!4559 (_2!4004 lt!136856)) (currentByte!4564 (_2!4004 lt!136856)) (size!1911 (buf!2301 (_2!4004 lt!136856)))))))

(declare-fun res!74186 () Bool)

(assert (=> start!18186 (=> (not res!74186) (not e!59369))))

(assert (=> start!18186 (= res!74186 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18186 e!59369))

(declare-fun inv!12 (BitStream!3384) Bool)

(assert (=> start!18186 (and (inv!12 thiss!1152) e!59370)))

(assert (=> start!18186 (and (inv!12 thiss!1151) e!59376)))

(assert (=> start!18186 true))

(declare-fun b!90027 () Bool)

(assert (=> b!90027 (= e!59373 e!59368)))

(declare-fun res!74184 () Bool)

(assert (=> b!90027 (=> (not res!74184) (not e!59368))))

(assert (=> b!90027 (= res!74184 (bvsge (_3!240 lt!136856) #b00000000000000000000000000000000))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstWhileWhile!0 ((_ BitVec 32) BitStream!3384 (_ BitVec 64) BitStream!3384 (_ BitVec 32)) tuple3!432)

(assert (=> b!90027 (= lt!136856 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4003 lt!136857) (bvadd #b00000000000000000000000000000001 i!576)))))

(declare-fun b!90028 () Bool)

(assert (=> b!90028 (= e!59374 (not e!59373))))

(declare-fun res!74187 () Bool)

(assert (=> b!90028 (=> res!74187 e!59373)))

(assert (=> b!90028 (= res!74187 (not (invariant!0 (currentBit!4559 (_2!4003 lt!136857)) (currentByte!4564 (_2!4003 lt!136857)) (size!1911 (buf!2301 (_2!4003 lt!136857))))))))

(assert (=> b!90028 e!59366))

(declare-fun res!74197 () Bool)

(assert (=> b!90028 (=> (not res!74197) (not e!59366))))

(assert (=> b!90028 (= res!74197 (= (size!1911 (buf!2301 thiss!1152)) (size!1911 (buf!2301 (_2!4003 lt!136857)))))))

(declare-fun appendBit!0 (BitStream!3384 Bool) tuple2!7526)

(assert (=> b!90028 (= lt!136857 (appendBit!0 thiss!1152 lt!136854))))

(assert (=> b!90028 (= lt!136854 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!18186 res!74186) b!90011))

(assert (= (and b!90011 res!74193) b!90008))

(assert (= (and b!90008 res!74196) b!90015))

(assert (= (and b!90015 res!74181) b!90014))

(assert (= (and b!90014 res!74190) b!90019))

(assert (= (and b!90019 res!74180) b!90018))

(assert (= (and b!90018 res!74189) b!90017))

(assert (= (and b!90017 res!74188) b!90021))

(assert (= (and b!90021 res!74195) b!90028))

(assert (= (and b!90028 res!74197) b!90025))

(assert (= (and b!90025 res!74194) b!90009))

(assert (= (and b!90009 res!74192) b!90024))

(assert (= (and b!90024 res!74191) b!90012))

(assert (= (and b!90028 (not res!74187)) b!90020))

(assert (= (and b!90020 (not res!74183)) b!90027))

(assert (= (and b!90027 res!74184) b!90013))

(assert (= (and b!90013 res!74179) b!90023))

(assert (= (and b!90023 res!74185) b!90016))

(assert (= (and b!90016 res!74182) b!90010))

(assert (= start!18186 b!90022))

(assert (= start!18186 b!90026))

(declare-fun m!134627 () Bool)

(assert (=> b!90009 m!134627))

(declare-fun m!134629 () Bool)

(assert (=> b!90026 m!134629))

(declare-fun m!134631 () Bool)

(assert (=> b!90024 m!134631))

(assert (=> b!90024 m!134631))

(declare-fun m!134633 () Bool)

(assert (=> b!90024 m!134633))

(declare-fun m!134635 () Bool)

(assert (=> b!90010 m!134635))

(declare-fun m!134637 () Bool)

(assert (=> b!90028 m!134637))

(declare-fun m!134639 () Bool)

(assert (=> b!90028 m!134639))

(declare-fun m!134641 () Bool)

(assert (=> start!18186 m!134641))

(declare-fun m!134643 () Bool)

(assert (=> start!18186 m!134643))

(declare-fun m!134645 () Bool)

(assert (=> b!90017 m!134645))

(declare-fun m!134647 () Bool)

(assert (=> b!90016 m!134647))

(declare-fun m!134649 () Bool)

(assert (=> b!90025 m!134649))

(declare-fun m!134651 () Bool)

(assert (=> b!90018 m!134651))

(declare-fun m!134653 () Bool)

(assert (=> b!90018 m!134653))

(declare-fun m!134655 () Bool)

(assert (=> b!90008 m!134655))

(declare-fun m!134657 () Bool)

(assert (=> b!90012 m!134657))

(declare-fun m!134659 () Bool)

(assert (=> b!90022 m!134659))

(declare-fun m!134661 () Bool)

(assert (=> b!90013 m!134661))

(declare-fun m!134663 () Bool)

(assert (=> b!90014 m!134663))

(declare-fun m!134665 () Bool)

(assert (=> b!90027 m!134665))

(declare-fun m!134667 () Bool)

(assert (=> b!90011 m!134667))

(check-sat (not b!90026) (not b!90025) (not b!90027) (not b!90010) (not start!18186) (not b!90017) (not b!90011) (not b!90024) (not b!90028) (not b!90013) (not b!90008) (not b!90014) (not b!90018) (not b!90022) (not b!90012) (not b!90009) (not b!90016))
(check-sat)
(get-model)

(declare-fun d!28026 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28026 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4004 lt!136856)))) ((_ sign_extend 32) (currentByte!4564 (_2!4004 lt!136856))) ((_ sign_extend 32) (currentBit!4559 (_2!4004 lt!136856))) ((_ sign_extend 32) (bvsub nBits!336 (_3!240 lt!136856)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4004 lt!136856)))) ((_ sign_extend 32) (currentByte!4564 (_2!4004 lt!136856))) ((_ sign_extend 32) (currentBit!4559 (_2!4004 lt!136856)))) ((_ sign_extend 32) (bvsub nBits!336 (_3!240 lt!136856)))))))

(declare-fun bs!6947 () Bool)

(assert (= bs!6947 d!28026))

(declare-fun m!134711 () Bool)

(assert (=> bs!6947 m!134711))

(assert (=> b!90010 d!28026))

(declare-fun d!28028 () Bool)

(assert (=> d!28028 (= (array_inv!1757 (buf!2301 thiss!1152)) (bvsge (size!1911 (buf!2301 thiss!1152)) #b00000000000000000000000000000000))))

(assert (=> b!90022 d!28028))

(declare-fun d!28030 () Bool)

(declare-fun e!59412 () Bool)

(assert (=> d!28030 e!59412))

(declare-fun res!74260 () Bool)

(assert (=> d!28030 (=> (not res!74260) (not e!59412))))

(declare-fun lt!136893 () (_ BitVec 64))

(declare-fun lt!136894 () (_ BitVec 64))

(declare-fun lt!136895 () (_ BitVec 64))

(assert (=> d!28030 (= res!74260 (= lt!136894 (bvsub lt!136895 lt!136893)))))

(assert (=> d!28030 (or (= (bvand lt!136895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136893 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136895 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136895 lt!136893) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28030 (= lt!136893 (remainingBits!0 ((_ sign_extend 32) (size!1911 (buf!2301 (_1!4005 lt!136851)))) ((_ sign_extend 32) (currentByte!4564 (_1!4005 lt!136851))) ((_ sign_extend 32) (currentBit!4559 (_1!4005 lt!136851)))))))

(declare-fun lt!136892 () (_ BitVec 64))

(declare-fun lt!136896 () (_ BitVec 64))

(assert (=> d!28030 (= lt!136895 (bvmul lt!136892 lt!136896))))

(assert (=> d!28030 (or (= lt!136892 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136896 (bvsdiv (bvmul lt!136892 lt!136896) lt!136892)))))

(assert (=> d!28030 (= lt!136896 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28030 (= lt!136892 ((_ sign_extend 32) (size!1911 (buf!2301 (_1!4005 lt!136851)))))))

(assert (=> d!28030 (= lt!136894 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4564 (_1!4005 lt!136851))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4559 (_1!4005 lt!136851)))))))

(assert (=> d!28030 (invariant!0 (currentBit!4559 (_1!4005 lt!136851)) (currentByte!4564 (_1!4005 lt!136851)) (size!1911 (buf!2301 (_1!4005 lt!136851))))))

(assert (=> d!28030 (= (bitIndex!0 (size!1911 (buf!2301 (_1!4005 lt!136851))) (currentByte!4564 (_1!4005 lt!136851)) (currentBit!4559 (_1!4005 lt!136851))) lt!136894)))

(declare-fun b!90096 () Bool)

(declare-fun res!74259 () Bool)

(assert (=> b!90096 (=> (not res!74259) (not e!59412))))

(assert (=> b!90096 (= res!74259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136894))))

(declare-fun b!90097 () Bool)

(declare-fun lt!136891 () (_ BitVec 64))

(assert (=> b!90097 (= e!59412 (bvsle lt!136894 (bvmul lt!136891 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90097 (or (= lt!136891 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136891 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136891)))))

(assert (=> b!90097 (= lt!136891 ((_ sign_extend 32) (size!1911 (buf!2301 (_1!4005 lt!136851)))))))

(assert (= (and d!28030 res!74260) b!90096))

(assert (= (and b!90096 res!74259) b!90097))

(declare-fun m!134713 () Bool)

(assert (=> d!28030 m!134713))

(declare-fun m!134715 () Bool)

(assert (=> d!28030 m!134715))

(assert (=> b!90012 d!28030))

(declare-fun d!28032 () Bool)

(assert (=> d!28032 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1151))) ((_ sign_extend 32) (currentByte!4564 thiss!1151)) ((_ sign_extend 32) (currentBit!4559 thiss!1151)) ((_ sign_extend 32) nBits!336)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1151))) ((_ sign_extend 32) (currentByte!4564 thiss!1151)) ((_ sign_extend 32) (currentBit!4559 thiss!1151))) ((_ sign_extend 32) nBits!336)))))

(declare-fun bs!6948 () Bool)

(assert (= bs!6948 d!28032))

(declare-fun m!134717 () Bool)

(assert (=> bs!6948 m!134717))

(assert (=> b!90011 d!28032))

(declare-fun d!28034 () Bool)

(declare-fun e!59413 () Bool)

(assert (=> d!28034 e!59413))

(declare-fun res!74262 () Bool)

(assert (=> d!28034 (=> (not res!74262) (not e!59413))))

(declare-fun lt!136900 () (_ BitVec 64))

(declare-fun lt!136901 () (_ BitVec 64))

(declare-fun lt!136899 () (_ BitVec 64))

(assert (=> d!28034 (= res!74262 (= lt!136900 (bvsub lt!136901 lt!136899)))))

(assert (=> d!28034 (or (= (bvand lt!136901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136899 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136901 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136901 lt!136899) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28034 (= lt!136899 (remainingBits!0 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1152))) ((_ sign_extend 32) (currentByte!4564 thiss!1152)) ((_ sign_extend 32) (currentBit!4559 thiss!1152))))))

(declare-fun lt!136898 () (_ BitVec 64))

(declare-fun lt!136902 () (_ BitVec 64))

(assert (=> d!28034 (= lt!136901 (bvmul lt!136898 lt!136902))))

(assert (=> d!28034 (or (= lt!136898 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136902 (bvsdiv (bvmul lt!136898 lt!136902) lt!136898)))))

(assert (=> d!28034 (= lt!136902 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28034 (= lt!136898 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1152))))))

(assert (=> d!28034 (= lt!136900 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4564 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4559 thiss!1152))))))

(assert (=> d!28034 (invariant!0 (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152) (size!1911 (buf!2301 thiss!1152)))))

(assert (=> d!28034 (= (bitIndex!0 (size!1911 (buf!2301 thiss!1152)) (currentByte!4564 thiss!1152) (currentBit!4559 thiss!1152)) lt!136900)))

(declare-fun b!90098 () Bool)

(declare-fun res!74261 () Bool)

(assert (=> b!90098 (=> (not res!74261) (not e!59413))))

(assert (=> b!90098 (= res!74261 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136900))))

(declare-fun b!90099 () Bool)

(declare-fun lt!136897 () (_ BitVec 64))

(assert (=> b!90099 (= e!59413 (bvsle lt!136900 (bvmul lt!136897 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90099 (or (= lt!136897 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136897 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136897)))))

(assert (=> b!90099 (= lt!136897 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1152))))))

(assert (= (and d!28034 res!74262) b!90098))

(assert (= (and b!90098 res!74261) b!90099))

(declare-fun m!134719 () Bool)

(assert (=> d!28034 m!134719))

(assert (=> d!28034 m!134663))

(assert (=> b!90018 d!28034))

(declare-fun d!28036 () Bool)

(declare-fun e!59414 () Bool)

(assert (=> d!28036 e!59414))

(declare-fun res!74264 () Bool)

(assert (=> d!28036 (=> (not res!74264) (not e!59414))))

(declare-fun lt!136907 () (_ BitVec 64))

(declare-fun lt!136905 () (_ BitVec 64))

(declare-fun lt!136906 () (_ BitVec 64))

(assert (=> d!28036 (= res!74264 (= lt!136906 (bvsub lt!136907 lt!136905)))))

(assert (=> d!28036 (or (= (bvand lt!136907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136905 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136907 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136907 lt!136905) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28036 (= lt!136905 (remainingBits!0 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1151))) ((_ sign_extend 32) (currentByte!4564 thiss!1151)) ((_ sign_extend 32) (currentBit!4559 thiss!1151))))))

(declare-fun lt!136904 () (_ BitVec 64))

(declare-fun lt!136908 () (_ BitVec 64))

(assert (=> d!28036 (= lt!136907 (bvmul lt!136904 lt!136908))))

(assert (=> d!28036 (or (= lt!136904 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136908 (bvsdiv (bvmul lt!136904 lt!136908) lt!136904)))))

(assert (=> d!28036 (= lt!136908 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28036 (= lt!136904 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1151))))))

(assert (=> d!28036 (= lt!136906 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4564 thiss!1151)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4559 thiss!1151))))))

(assert (=> d!28036 (invariant!0 (currentBit!4559 thiss!1151) (currentByte!4564 thiss!1151) (size!1911 (buf!2301 thiss!1151)))))

(assert (=> d!28036 (= (bitIndex!0 (size!1911 (buf!2301 thiss!1151)) (currentByte!4564 thiss!1151) (currentBit!4559 thiss!1151)) lt!136906)))

(declare-fun b!90100 () Bool)

(declare-fun res!74263 () Bool)

(assert (=> b!90100 (=> (not res!74263) (not e!59414))))

(assert (=> b!90100 (= res!74263 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136906))))

(declare-fun b!90101 () Bool)

(declare-fun lt!136903 () (_ BitVec 64))

(assert (=> b!90101 (= e!59414 (bvsle lt!136906 (bvmul lt!136903 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90101 (or (= lt!136903 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136903 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136903)))))

(assert (=> b!90101 (= lt!136903 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1151))))))

(assert (= (and d!28036 res!74264) b!90100))

(assert (= (and b!90100 res!74263) b!90101))

(assert (=> d!28036 m!134717))

(assert (=> d!28036 m!134655))

(assert (=> b!90018 d!28036))

(declare-fun d!28038 () Bool)

(assert (=> d!28038 (= (invariant!0 (currentBit!4559 thiss!1151) (currentByte!4564 thiss!1151) (size!1911 (buf!2301 thiss!1151))) (and (bvsge (currentBit!4559 thiss!1151) #b00000000000000000000000000000000) (bvslt (currentBit!4559 thiss!1151) #b00000000000000000000000000001000) (bvsge (currentByte!4564 thiss!1151) #b00000000000000000000000000000000) (or (bvslt (currentByte!4564 thiss!1151) (size!1911 (buf!2301 thiss!1151))) (and (= (currentBit!4559 thiss!1151) #b00000000000000000000000000000000) (= (currentByte!4564 thiss!1151) (size!1911 (buf!2301 thiss!1151)))))))))

(assert (=> b!90008 d!28038))

(declare-fun d!28040 () Bool)

(declare-fun res!74272 () Bool)

(declare-fun e!59420 () Bool)

(assert (=> d!28040 (=> (not res!74272) (not e!59420))))

(assert (=> d!28040 (= res!74272 (= (size!1911 (buf!2301 thiss!1152)) (size!1911 (buf!2301 (_2!4003 lt!136857)))))))

(assert (=> d!28040 (= (isPrefixOf!0 thiss!1152 (_2!4003 lt!136857)) e!59420)))

(declare-fun b!90108 () Bool)

(declare-fun res!74271 () Bool)

(assert (=> b!90108 (=> (not res!74271) (not e!59420))))

(assert (=> b!90108 (= res!74271 (bvsle (bitIndex!0 (size!1911 (buf!2301 thiss!1152)) (currentByte!4564 thiss!1152) (currentBit!4559 thiss!1152)) (bitIndex!0 (size!1911 (buf!2301 (_2!4003 lt!136857))) (currentByte!4564 (_2!4003 lt!136857)) (currentBit!4559 (_2!4003 lt!136857)))))))

(declare-fun b!90109 () Bool)

(declare-fun e!59419 () Bool)

(assert (=> b!90109 (= e!59420 e!59419)))

(declare-fun res!74273 () Bool)

(assert (=> b!90109 (=> res!74273 e!59419)))

(assert (=> b!90109 (= res!74273 (= (size!1911 (buf!2301 thiss!1152)) #b00000000000000000000000000000000))))

(declare-fun b!90110 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4235 array!4235 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!90110 (= e!59419 (arrayBitRangesEq!0 (buf!2301 thiss!1152) (buf!2301 (_2!4003 lt!136857)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1911 (buf!2301 thiss!1152)) (currentByte!4564 thiss!1152) (currentBit!4559 thiss!1152))))))

(assert (= (and d!28040 res!74272) b!90108))

(assert (= (and b!90108 res!74271) b!90109))

(assert (= (and b!90109 (not res!74273)) b!90110))

(assert (=> b!90108 m!134651))

(assert (=> b!90108 m!134649))

(assert (=> b!90110 m!134651))

(assert (=> b!90110 m!134651))

(declare-fun m!134721 () Bool)

(assert (=> b!90110 m!134721))

(assert (=> b!90009 d!28040))

(declare-fun d!28042 () Bool)

(assert (=> d!28042 (= (array_inv!1757 (buf!2301 thiss!1151)) (bvsge (size!1911 (buf!2301 thiss!1151)) #b00000000000000000000000000000000))))

(assert (=> b!90026 d!28042))

(declare-fun d!28044 () Bool)

(declare-fun e!59421 () Bool)

(assert (=> d!28044 e!59421))

(declare-fun res!74275 () Bool)

(assert (=> d!28044 (=> (not res!74275) (not e!59421))))

(declare-fun lt!136913 () (_ BitVec 64))

(declare-fun lt!136912 () (_ BitVec 64))

(declare-fun lt!136911 () (_ BitVec 64))

(assert (=> d!28044 (= res!74275 (= lt!136912 (bvsub lt!136913 lt!136911)))))

(assert (=> d!28044 (or (= (bvand lt!136913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!136913 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!136913 lt!136911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28044 (= lt!136911 (remainingBits!0 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4004 lt!136856)))) ((_ sign_extend 32) (currentByte!4564 (_2!4004 lt!136856))) ((_ sign_extend 32) (currentBit!4559 (_2!4004 lt!136856)))))))

(declare-fun lt!136910 () (_ BitVec 64))

(declare-fun lt!136914 () (_ BitVec 64))

(assert (=> d!28044 (= lt!136913 (bvmul lt!136910 lt!136914))))

(assert (=> d!28044 (or (= lt!136910 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!136914 (bvsdiv (bvmul lt!136910 lt!136914) lt!136910)))))

(assert (=> d!28044 (= lt!136914 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28044 (= lt!136910 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4004 lt!136856)))))))

(assert (=> d!28044 (= lt!136912 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4564 (_2!4004 lt!136856))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4559 (_2!4004 lt!136856)))))))

(assert (=> d!28044 (invariant!0 (currentBit!4559 (_2!4004 lt!136856)) (currentByte!4564 (_2!4004 lt!136856)) (size!1911 (buf!2301 (_2!4004 lt!136856))))))

(assert (=> d!28044 (= (bitIndex!0 (size!1911 (buf!2301 (_2!4004 lt!136856))) (currentByte!4564 (_2!4004 lt!136856)) (currentBit!4559 (_2!4004 lt!136856))) lt!136912)))

(declare-fun b!90111 () Bool)

(declare-fun res!74274 () Bool)

(assert (=> b!90111 (=> (not res!74274) (not e!59421))))

(assert (=> b!90111 (= res!74274 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!136912))))

(declare-fun b!90112 () Bool)

(declare-fun lt!136909 () (_ BitVec 64))

(assert (=> b!90112 (= e!59421 (bvsle lt!136912 (bvmul lt!136909 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90112 (or (= lt!136909 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!136909 #b0000000000000000000000000000000000000000000000000000000000001000) lt!136909)))))

(assert (=> b!90112 (= lt!136909 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4004 lt!136856)))))))

(assert (= (and d!28044 res!74275) b!90111))

(assert (= (and b!90111 res!74274) b!90112))

(assert (=> d!28044 m!134711))

(assert (=> d!28044 m!134661))

(assert (=> b!90016 d!28044))

(declare-fun d!28046 () Bool)

(assert (=> d!28046 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1152))) ((_ sign_extend 32) (currentByte!4564 thiss!1152)) ((_ sign_extend 32) (currentBit!4559 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1152))) ((_ sign_extend 32) (currentByte!4564 thiss!1152)) ((_ sign_extend 32) (currentBit!4559 thiss!1152))) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun bs!6949 () Bool)

(assert (= bs!6949 d!28046))

(assert (=> bs!6949 m!134719))

(assert (=> b!90017 d!28046))

(declare-fun b!90157 () Bool)

(declare-fun e!59440 () Bool)

(declare-fun lt!136970 () tuple3!432)

(assert (=> b!90157 (= e!59440 (bvsge (_3!240 lt!136970) nBits!336))))

(declare-fun b!90158 () Bool)

(declare-fun res!74327 () Bool)

(declare-fun e!59438 () Bool)

(assert (=> b!90158 (=> (not res!74327) (not e!59438))))

(assert (=> b!90158 (= res!74327 (validate_offset_bits!1 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4003 lt!136857)))) ((_ sign_extend 32) (currentByte!4564 (_2!4003 lt!136857))) ((_ sign_extend 32) (currentBit!4559 (_2!4003 lt!136857))) ((_ sign_extend 32) (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90159 () Bool)

(declare-fun res!74321 () Bool)

(assert (=> b!90159 (=> (not res!74321) (not e!59438))))

(assert (=> b!90159 (= res!74321 (= (bitIndex!0 (size!1911 (buf!2301 (_2!4003 lt!136857))) (currentByte!4564 (_2!4003 lt!136857)) (currentBit!4559 (_2!4003 lt!136857))) (bvadd (bitIndex!0 (size!1911 (buf!2301 thiss!1151)) (currentByte!4564 thiss!1151) (currentBit!4559 thiss!1151)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))))))

(declare-fun b!90160 () Bool)

(declare-fun res!74320 () Bool)

(assert (=> b!90160 (=> (not res!74320) (not e!59440))))

(assert (=> b!90160 (= res!74320 (validate_offset_bits!1 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4004 lt!136970)))) ((_ sign_extend 32) (currentByte!4564 (_2!4004 lt!136970))) ((_ sign_extend 32) (currentBit!4559 (_2!4004 lt!136970))) ((_ sign_extend 32) (bvsub nBits!336 (_3!240 lt!136970)))))))

(assert (=> b!90160 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (_3!240 lt!136970) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (_3!240 lt!136970)) #b10000000000000000000000000000000)))))

(declare-fun b!90161 () Bool)

(declare-fun res!74325 () Bool)

(assert (=> b!90161 (=> (not res!74325) (not e!59438))))

(assert (=> b!90161 (= res!74325 (invariant!0 (currentBit!4559 (_2!4003 lt!136857)) (currentByte!4564 (_2!4003 lt!136857)) (size!1911 (buf!2301 (_2!4003 lt!136857)))))))

(declare-fun b!90162 () Bool)

(declare-fun res!74318 () Bool)

(assert (=> b!90162 (=> (not res!74318) (not e!59438))))

(assert (=> b!90162 (= res!74318 (and (bvsle (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (= (size!1911 (buf!2301 (_2!4003 lt!136857))) (size!1911 (buf!2301 thiss!1151)))))))

(declare-fun b!90163 () Bool)

(declare-fun res!74323 () Bool)

(assert (=> b!90163 (=> (not res!74323) (not e!59440))))

(declare-fun lt!136974 () (_ BitVec 64))

(declare-fun lt!136972 () (_ BitVec 64))

(assert (=> b!90163 (= res!74323 (= (bitIndex!0 (size!1911 (buf!2301 (_2!4004 lt!136970))) (currentByte!4564 (_2!4004 lt!136970)) (currentBit!4559 (_2!4004 lt!136970))) (bvadd lt!136972 lt!136974)))))

(assert (=> b!90163 (or (not (= (bvand lt!136972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!136974 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!136972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!136972 lt!136974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90163 (= lt!136974 ((_ sign_extend 32) (_3!240 lt!136970)))))

(assert (=> b!90163 (= lt!136972 (bitIndex!0 (size!1911 (buf!2301 thiss!1151)) (currentByte!4564 thiss!1151) (currentBit!4559 thiss!1151)))))

(declare-fun b!90164 () Bool)

(declare-fun e!59439 () Bool)

(declare-fun e!59441 () Bool)

(assert (=> b!90164 (= e!59439 e!59441)))

(declare-fun res!74319 () Bool)

(assert (=> b!90164 (=> (not res!74319) (not e!59441))))

(declare-fun lt!136968 () Bool)

(declare-fun lt!136967 () tuple2!7528)

(declare-fun lt!136969 () tuple2!7526)

(assert (=> b!90164 (= res!74319 (and (= (_2!4005 lt!136967) lt!136968) (= (_1!4005 lt!136967) (_2!4003 lt!136969))))))

(assert (=> b!90164 (= lt!136967 (readBitPure!0 (readerFrom!0 (_2!4003 lt!136969) (currentBit!4559 (_2!4003 lt!136857)) (currentByte!4564 (_2!4003 lt!136857)))))))

(declare-fun b!90165 () Bool)

(assert (=> b!90165 (= e!59438 (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336))))

(declare-fun b!90166 () Bool)

(declare-fun res!74324 () Bool)

(assert (=> b!90166 (=> (not res!74324) (not e!59439))))

(assert (=> b!90166 (= res!74324 (= (bitIndex!0 (size!1911 (buf!2301 (_2!4003 lt!136969))) (currentByte!4564 (_2!4003 lt!136969)) (currentBit!4559 (_2!4003 lt!136969))) (bvadd (bitIndex!0 (size!1911 (buf!2301 (_2!4003 lt!136857))) (currentByte!4564 (_2!4003 lt!136857)) (currentBit!4559 (_2!4003 lt!136857))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!90167 () Bool)

(declare-fun res!74326 () Bool)

(assert (=> b!90167 (=> (not res!74326) (not e!59440))))

(assert (=> b!90167 (= res!74326 (invariant!0 (currentBit!4559 (_2!4004 lt!136970)) (currentByte!4564 (_2!4004 lt!136970)) (size!1911 (buf!2301 (_2!4004 lt!136970)))))))

(declare-fun d!28048 () Bool)

(assert (=> d!28048 e!59440))

(declare-fun res!74322 () Bool)

(assert (=> d!28048 (=> (not res!74322) (not e!59440))))

(assert (=> d!28048 (= res!74322 (bvsge (_3!240 lt!136970) #b00000000000000000000000000000000))))

(declare-fun e!59442 () tuple3!432)

(assert (=> d!28048 (= lt!136970 e!59442)))

(declare-fun c!5870 () Bool)

(declare-fun lt!136973 () (_ BitVec 32))

(assert (=> d!28048 (= c!5870 (bvslt lt!136973 nBits!336))))

(assert (=> d!28048 (= lt!136973 (bvadd #b00000000000000000000000000000001 i!576 #b00000000000000000000000000000001))))

(declare-fun lt!136971 () tuple2!7526)

(assert (=> d!28048 (= lt!136971 lt!136969)))

(assert (=> d!28048 e!59439))

(declare-fun res!74317 () Bool)

(assert (=> d!28048 (=> (not res!74317) (not e!59439))))

(assert (=> d!28048 (= res!74317 (= (size!1911 (buf!2301 (_2!4003 lt!136857))) (size!1911 (buf!2301 (_2!4003 lt!136969)))))))

(assert (=> d!28048 (= lt!136969 (appendBit!0 (_2!4003 lt!136857) lt!136968))))

(assert (=> d!28048 (= lt!136968 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28048 e!59438))

(declare-fun res!74316 () Bool)

(assert (=> d!28048 (=> (not res!74316) (not e!59438))))

(assert (=> d!28048 (= res!74316 (bvsge (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000))))

(assert (=> d!28048 (= (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4003 lt!136857) (bvadd #b00000000000000000000000000000001 i!576)) lt!136970)))

(declare-fun b!90168 () Bool)

(assert (=> b!90168 (= e!59442 (appendBitsLSBFirstWhileWhile!0 nBits!336 thiss!1151 v!179 (_2!4003 lt!136971) lt!136973))))

(declare-fun b!90169 () Bool)

(declare-fun res!74328 () Bool)

(assert (=> b!90169 (=> (not res!74328) (not e!59439))))

(assert (=> b!90169 (= res!74328 (isPrefixOf!0 (_2!4003 lt!136857) (_2!4003 lt!136969)))))

(declare-fun b!90170 () Bool)

(declare-fun res!74329 () Bool)

(assert (=> b!90170 (=> (not res!74329) (not e!59440))))

(assert (=> b!90170 (= res!74329 (and (bvsle (_3!240 lt!136970) nBits!336) (= (size!1911 (buf!2301 (_2!4004 lt!136970))) (size!1911 (buf!2301 thiss!1151)))))))

(declare-fun b!90171 () Bool)

(assert (=> b!90171 (= e!59441 (= (bitIndex!0 (size!1911 (buf!2301 (_1!4005 lt!136967))) (currentByte!4564 (_1!4005 lt!136967)) (currentBit!4559 (_1!4005 lt!136967))) (bitIndex!0 (size!1911 (buf!2301 (_2!4003 lt!136969))) (currentByte!4564 (_2!4003 lt!136969)) (currentBit!4559 (_2!4003 lt!136969)))))))

(declare-fun b!90172 () Bool)

(declare-fun Unit!5814 () Unit!5808)

(assert (=> b!90172 (= e!59442 (tuple3!433 Unit!5814 (_2!4003 lt!136971) lt!136973))))

(assert (= (and d!28048 res!74316) b!90161))

(assert (= (and b!90161 res!74325) b!90162))

(assert (= (and b!90162 res!74318) b!90159))

(assert (= (and b!90159 res!74321) b!90158))

(assert (= (and b!90158 res!74327) b!90165))

(assert (= (and d!28048 res!74317) b!90166))

(assert (= (and b!90166 res!74324) b!90169))

(assert (= (and b!90169 res!74328) b!90164))

(assert (= (and b!90164 res!74319) b!90171))

(assert (= (and d!28048 c!5870) b!90168))

(assert (= (and d!28048 (not c!5870)) b!90172))

(assert (= (and d!28048 res!74322) b!90167))

(assert (= (and b!90167 res!74326) b!90170))

(assert (= (and b!90170 res!74329) b!90163))

(assert (= (and b!90163 res!74323) b!90160))

(assert (= (and b!90160 res!74320) b!90157))

(declare-fun m!134729 () Bool)

(assert (=> d!28048 m!134729))

(declare-fun m!134731 () Bool)

(assert (=> b!90166 m!134731))

(assert (=> b!90166 m!134649))

(declare-fun m!134733 () Bool)

(assert (=> b!90164 m!134733))

(assert (=> b!90164 m!134733))

(declare-fun m!134735 () Bool)

(assert (=> b!90164 m!134735))

(declare-fun m!134737 () Bool)

(assert (=> b!90169 m!134737))

(declare-fun m!134739 () Bool)

(assert (=> b!90168 m!134739))

(declare-fun m!134741 () Bool)

(assert (=> b!90158 m!134741))

(declare-fun m!134743 () Bool)

(assert (=> b!90167 m!134743))

(declare-fun m!134745 () Bool)

(assert (=> b!90160 m!134745))

(declare-fun m!134747 () Bool)

(assert (=> b!90163 m!134747))

(assert (=> b!90163 m!134653))

(assert (=> b!90161 m!134637))

(declare-fun m!134749 () Bool)

(assert (=> b!90171 m!134749))

(assert (=> b!90171 m!134731))

(assert (=> b!90159 m!134649))

(assert (=> b!90159 m!134653))

(assert (=> b!90027 d!28048))

(declare-fun d!28062 () Bool)

(assert (=> d!28062 (= (invariant!0 (currentBit!4559 (_2!4003 lt!136857)) (currentByte!4564 (_2!4003 lt!136857)) (size!1911 (buf!2301 (_2!4003 lt!136857)))) (and (bvsge (currentBit!4559 (_2!4003 lt!136857)) #b00000000000000000000000000000000) (bvslt (currentBit!4559 (_2!4003 lt!136857)) #b00000000000000000000000000001000) (bvsge (currentByte!4564 (_2!4003 lt!136857)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4564 (_2!4003 lt!136857)) (size!1911 (buf!2301 (_2!4003 lt!136857)))) (and (= (currentBit!4559 (_2!4003 lt!136857)) #b00000000000000000000000000000000) (= (currentByte!4564 (_2!4003 lt!136857)) (size!1911 (buf!2301 (_2!4003 lt!136857))))))))))

(assert (=> b!90028 d!28062))

(declare-fun b!90292 () Bool)

(declare-fun res!74439 () Bool)

(declare-fun e!59484 () Bool)

(assert (=> b!90292 (=> (not res!74439) (not e!59484))))

(declare-fun lt!137075 () (_ BitVec 64))

(declare-fun lt!137076 () tuple2!7526)

(declare-fun lt!137074 () (_ BitVec 64))

(assert (=> b!90292 (= res!74439 (= (bitIndex!0 (size!1911 (buf!2301 (_2!4003 lt!137076))) (currentByte!4564 (_2!4003 lt!137076)) (currentBit!4559 (_2!4003 lt!137076))) (bvadd lt!137074 lt!137075)))))

(assert (=> b!90292 (or (not (= (bvand lt!137074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137075 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!137074 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!137074 lt!137075) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!90292 (= lt!137075 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!90292 (= lt!137074 (bitIndex!0 (size!1911 (buf!2301 thiss!1152)) (currentByte!4564 thiss!1152) (currentBit!4559 thiss!1152)))))

(declare-fun d!28064 () Bool)

(assert (=> d!28064 e!59484))

(declare-fun res!74437 () Bool)

(assert (=> d!28064 (=> (not res!74437) (not e!59484))))

(assert (=> d!28064 (= res!74437 (= (size!1911 (buf!2301 thiss!1152)) (size!1911 (buf!2301 (_2!4003 lt!137076)))))))

(declare-fun choose!16 (BitStream!3384 Bool) tuple2!7526)

(assert (=> d!28064 (= lt!137076 (choose!16 thiss!1152 lt!136854))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!28064 (validate_offset_bit!0 ((_ sign_extend 32) (size!1911 (buf!2301 thiss!1152))) ((_ sign_extend 32) (currentByte!4564 thiss!1152)) ((_ sign_extend 32) (currentBit!4559 thiss!1152)))))

(assert (=> d!28064 (= (appendBit!0 thiss!1152 lt!136854) lt!137076)))

(declare-fun b!90293 () Bool)

(declare-fun res!74438 () Bool)

(assert (=> b!90293 (=> (not res!74438) (not e!59484))))

(assert (=> b!90293 (= res!74438 (isPrefixOf!0 thiss!1152 (_2!4003 lt!137076)))))

(declare-fun b!90294 () Bool)

(declare-fun e!59485 () Bool)

(assert (=> b!90294 (= e!59484 e!59485)))

(declare-fun res!74436 () Bool)

(assert (=> b!90294 (=> (not res!74436) (not e!59485))))

(declare-fun lt!137073 () tuple2!7528)

(assert (=> b!90294 (= res!74436 (and (= (_2!4005 lt!137073) lt!136854) (= (_1!4005 lt!137073) (_2!4003 lt!137076))))))

(assert (=> b!90294 (= lt!137073 (readBitPure!0 (readerFrom!0 (_2!4003 lt!137076) (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152))))))

(declare-fun b!90295 () Bool)

(assert (=> b!90295 (= e!59485 (= (bitIndex!0 (size!1911 (buf!2301 (_1!4005 lt!137073))) (currentByte!4564 (_1!4005 lt!137073)) (currentBit!4559 (_1!4005 lt!137073))) (bitIndex!0 (size!1911 (buf!2301 (_2!4003 lt!137076))) (currentByte!4564 (_2!4003 lt!137076)) (currentBit!4559 (_2!4003 lt!137076)))))))

(assert (= (and d!28064 res!74437) b!90292))

(assert (= (and b!90292 res!74439) b!90293))

(assert (= (and b!90293 res!74438) b!90294))

(assert (= (and b!90294 res!74436) b!90295))

(declare-fun m!134809 () Bool)

(assert (=> b!90295 m!134809))

(declare-fun m!134811 () Bool)

(assert (=> b!90295 m!134811))

(declare-fun m!134813 () Bool)

(assert (=> b!90293 m!134813))

(assert (=> b!90292 m!134811))

(assert (=> b!90292 m!134651))

(declare-fun m!134817 () Bool)

(assert (=> b!90294 m!134817))

(assert (=> b!90294 m!134817))

(declare-fun m!134819 () Bool)

(assert (=> b!90294 m!134819))

(declare-fun m!134821 () Bool)

(assert (=> d!28064 m!134821))

(declare-fun m!134823 () Bool)

(assert (=> d!28064 m!134823))

(assert (=> b!90028 d!28064))

(declare-fun d!28110 () Bool)

(assert (=> d!28110 (= (invariant!0 (currentBit!4559 (_2!4004 lt!136856)) (currentByte!4564 (_2!4004 lt!136856)) (size!1911 (buf!2301 (_2!4004 lt!136856)))) (and (bvsge (currentBit!4559 (_2!4004 lt!136856)) #b00000000000000000000000000000000) (bvslt (currentBit!4559 (_2!4004 lt!136856)) #b00000000000000000000000000001000) (bvsge (currentByte!4564 (_2!4004 lt!136856)) #b00000000000000000000000000000000) (or (bvslt (currentByte!4564 (_2!4004 lt!136856)) (size!1911 (buf!2301 (_2!4004 lt!136856)))) (and (= (currentBit!4559 (_2!4004 lt!136856)) #b00000000000000000000000000000000) (= (currentByte!4564 (_2!4004 lt!136856)) (size!1911 (buf!2301 (_2!4004 lt!136856))))))))))

(assert (=> b!90013 d!28110))

(declare-fun d!28112 () Bool)

(declare-datatypes ((tuple2!7534 0))(
  ( (tuple2!7535 (_1!4009 Bool) (_2!4009 BitStream!3384)) )
))
(declare-fun lt!137084 () tuple2!7534)

(declare-fun readBit!0 (BitStream!3384) tuple2!7534)

(assert (=> d!28112 (= lt!137084 (readBit!0 (readerFrom!0 (_2!4003 lt!136857) (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152))))))

(assert (=> d!28112 (= (readBitPure!0 (readerFrom!0 (_2!4003 lt!136857) (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152))) (tuple2!7529 (_2!4009 lt!137084) (_1!4009 lt!137084)))))

(declare-fun bs!6960 () Bool)

(assert (= bs!6960 d!28112))

(assert (=> bs!6960 m!134631))

(declare-fun m!134827 () Bool)

(assert (=> bs!6960 m!134827))

(assert (=> b!90024 d!28112))

(declare-fun d!28118 () Bool)

(declare-fun e!59498 () Bool)

(assert (=> d!28118 e!59498))

(declare-fun res!74461 () Bool)

(assert (=> d!28118 (=> (not res!74461) (not e!59498))))

(assert (=> d!28118 (= res!74461 (invariant!0 (currentBit!4559 (_2!4003 lt!136857)) (currentByte!4564 (_2!4003 lt!136857)) (size!1911 (buf!2301 (_2!4003 lt!136857)))))))

(assert (=> d!28118 (= (readerFrom!0 (_2!4003 lt!136857) (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152)) (BitStream!3385 (buf!2301 (_2!4003 lt!136857)) (currentByte!4564 thiss!1152) (currentBit!4559 thiss!1152)))))

(declare-fun b!90316 () Bool)

(assert (=> b!90316 (= e!59498 (invariant!0 (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152) (size!1911 (buf!2301 (_2!4003 lt!136857)))))))

(assert (= (and d!28118 res!74461) b!90316))

(assert (=> d!28118 m!134637))

(declare-fun m!134833 () Bool)

(assert (=> b!90316 m!134833))

(assert (=> b!90024 d!28118))

(declare-fun d!28132 () Bool)

(assert (=> d!28132 (= (invariant!0 (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152) (size!1911 (buf!2301 thiss!1152))) (and (bvsge (currentBit!4559 thiss!1152) #b00000000000000000000000000000000) (bvslt (currentBit!4559 thiss!1152) #b00000000000000000000000000001000) (bvsge (currentByte!4564 thiss!1152) #b00000000000000000000000000000000) (or (bvslt (currentByte!4564 thiss!1152) (size!1911 (buf!2301 thiss!1152))) (and (= (currentBit!4559 thiss!1152) #b00000000000000000000000000000000) (= (currentByte!4564 thiss!1152) (size!1911 (buf!2301 thiss!1152)))))))))

(assert (=> b!90014 d!28132))

(declare-fun d!28134 () Bool)

(assert (=> d!28134 (= (inv!12 thiss!1152) (invariant!0 (currentBit!4559 thiss!1152) (currentByte!4564 thiss!1152) (size!1911 (buf!2301 thiss!1152))))))

(declare-fun bs!6962 () Bool)

(assert (= bs!6962 d!28134))

(assert (=> bs!6962 m!134663))

(assert (=> start!18186 d!28134))

(declare-fun d!28140 () Bool)

(assert (=> d!28140 (= (inv!12 thiss!1151) (invariant!0 (currentBit!4559 thiss!1151) (currentByte!4564 thiss!1151) (size!1911 (buf!2301 thiss!1151))))))

(declare-fun bs!6963 () Bool)

(assert (= bs!6963 d!28140))

(assert (=> bs!6963 m!134655))

(assert (=> start!18186 d!28140))

(declare-fun d!28142 () Bool)

(declare-fun e!59503 () Bool)

(assert (=> d!28142 e!59503))

(declare-fun res!74469 () Bool)

(assert (=> d!28142 (=> (not res!74469) (not e!59503))))

(declare-fun lt!137104 () (_ BitVec 64))

(declare-fun lt!137103 () (_ BitVec 64))

(declare-fun lt!137105 () (_ BitVec 64))

(assert (=> d!28142 (= res!74469 (= lt!137104 (bvsub lt!137105 lt!137103)))))

(assert (=> d!28142 (or (= (bvand lt!137105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!137103 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!137105 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!137105 lt!137103) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28142 (= lt!137103 (remainingBits!0 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4003 lt!136857)))) ((_ sign_extend 32) (currentByte!4564 (_2!4003 lt!136857))) ((_ sign_extend 32) (currentBit!4559 (_2!4003 lt!136857)))))))

(declare-fun lt!137102 () (_ BitVec 64))

(declare-fun lt!137106 () (_ BitVec 64))

(assert (=> d!28142 (= lt!137105 (bvmul lt!137102 lt!137106))))

(assert (=> d!28142 (or (= lt!137102 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!137106 (bvsdiv (bvmul lt!137102 lt!137106) lt!137102)))))

(assert (=> d!28142 (= lt!137106 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28142 (= lt!137102 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4003 lt!136857)))))))

(assert (=> d!28142 (= lt!137104 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4564 (_2!4003 lt!136857))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4559 (_2!4003 lt!136857)))))))

(assert (=> d!28142 (invariant!0 (currentBit!4559 (_2!4003 lt!136857)) (currentByte!4564 (_2!4003 lt!136857)) (size!1911 (buf!2301 (_2!4003 lt!136857))))))

(assert (=> d!28142 (= (bitIndex!0 (size!1911 (buf!2301 (_2!4003 lt!136857))) (currentByte!4564 (_2!4003 lt!136857)) (currentBit!4559 (_2!4003 lt!136857))) lt!137104)))

(declare-fun b!90323 () Bool)

(declare-fun res!74468 () Bool)

(assert (=> b!90323 (=> (not res!74468) (not e!59503))))

(assert (=> b!90323 (= res!74468 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!137104))))

(declare-fun b!90324 () Bool)

(declare-fun lt!137101 () (_ BitVec 64))

(assert (=> b!90324 (= e!59503 (bvsle lt!137104 (bvmul lt!137101 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!90324 (or (= lt!137101 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!137101 #b0000000000000000000000000000000000000000000000000000000000001000) lt!137101)))))

(assert (=> b!90324 (= lt!137101 ((_ sign_extend 32) (size!1911 (buf!2301 (_2!4003 lt!136857)))))))

(assert (= (and d!28142 res!74469) b!90323))

(assert (= (and b!90323 res!74468) b!90324))

(declare-fun m!134849 () Bool)

(assert (=> d!28142 m!134849))

(assert (=> d!28142 m!134637))

(assert (=> b!90025 d!28142))

(check-sat (not b!90159) (not b!90171) (not b!90316) (not d!28064) (not b!90292) (not d!28048) (not d!28026) (not b!90166) (not d!28118) (not b!90293) (not b!90163) (not b!90294) (not d!28044) (not b!90295) (not d!28134) (not b!90161) (not b!90168) (not b!90160) (not b!90167) (not d!28030) (not d!28036) (not b!90158) (not b!90110) (not d!28034) (not b!90108) (not d!28142) (not b!90164) (not d!28140) (not d!28112) (not d!28032) (not b!90169) (not d!28046))
(check-sat)
