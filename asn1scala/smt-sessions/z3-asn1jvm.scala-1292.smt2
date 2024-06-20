; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36780 () Bool)

(assert start!36780)

(declare-fun b!168505 () Bool)

(declare-fun res!140224 () Bool)

(declare-fun e!117072 () Bool)

(assert (=> b!168505 (=> (not res!140224) (not e!117072))))

(declare-datatypes ((array!8768 0))(
  ( (array!8769 (arr!4811 (Array (_ BitVec 32) (_ BitVec 8))) (size!3890 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6936 0))(
  ( (BitStream!6937 (buf!4342 array!8768) (currentByte!8230 (_ BitVec 32)) (currentBit!8225 (_ BitVec 32))) )
))
(declare-fun thiss!1894 () BitStream!6936)

(declare-fun nBits!600 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!168505 (= res!140224 (validate_offset_bits!1 ((_ sign_extend 32) (size!3890 (buf!4342 thiss!1894))) ((_ sign_extend 32) (currentByte!8230 thiss!1894)) ((_ sign_extend 32) (currentBit!8225 thiss!1894)) ((_ sign_extend 32) nBits!600)))))

(declare-datatypes ((Unit!11738 0))(
  ( (Unit!11739) )
))
(declare-datatypes ((tuple3!962 0))(
  ( (tuple3!963 (_1!7929 Unit!11738) (_2!7929 (_ BitVec 8)) (_3!607 BitStream!6936)) )
))
(declare-fun e!117075 () tuple3!962)

(declare-fun b!168506 () Bool)

(declare-fun lt!261826 () (_ BitVec 32))

(declare-fun Unit!11740 () Unit!11738)

(assert (=> b!168506 (= e!117075 (tuple3!963 Unit!11740 ((_ extract 7 0) (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvor ((_ sign_extend 24) ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!4811 (buf!4342 thiss!1894)) (currentByte!8230 thiss!1894))) lt!261826))) (bvlshr (bvand ((_ sign_extend 24) (select (arr!4811 (buf!4342 thiss!1894)) (bvadd #b00000000000000000000000000000001 (currentByte!8230 thiss!1894)))) #b00000000000000000000000011111111) (bvsub #b00000000000000000000000000001000 lt!261826))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (BitStream!6937 (buf!4342 thiss!1894) (bvadd #b00000000000000000000000000000001 (currentByte!8230 thiss!1894)) lt!261826)))))

(assert (=> b!168506 (= lt!261826 (bvsub (bvadd (currentBit!8225 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun b!168507 () Bool)

(declare-fun res!140225 () Bool)

(assert (=> b!168507 (=> (not res!140225) (not e!117072))))

(assert (=> b!168507 (= res!140225 (= (buf!4342 (_3!607 e!117075)) (buf!4342 thiss!1894)))))

(declare-fun c!8702 () Bool)

(assert (=> b!168507 (= c!8702 (bvsle (bvadd (currentBit!8225 thiss!1894) nBits!600) #b00000000000000000000000000001000))))

(declare-fun res!140223 () Bool)

(assert (=> start!36780 (=> (not res!140223) (not e!117072))))

(assert (=> start!36780 (= res!140223 (and (bvsge nBits!600 #b00000000000000000000000000000001) (bvslt nBits!600 #b00000000000000000000000000001000)))))

(assert (=> start!36780 e!117072))

(assert (=> start!36780 true))

(declare-fun e!117074 () Bool)

(declare-fun inv!12 (BitStream!6936) Bool)

(assert (=> start!36780 (and (inv!12 thiss!1894) e!117074)))

(declare-datatypes ((tuple2!14644 0))(
  ( (tuple2!14645 (_1!7930 Unit!11738) (_2!7930 BitStream!6936)) )
))
(declare-fun lt!261825 () tuple2!14644)

(declare-fun b!168508 () Bool)

(assert (=> b!168508 (= e!117075 (tuple3!963 (_1!7930 lt!261825) ((_ extract 7 0) (bvand (bvlshr ((_ sign_extend 24) (select (arr!4811 (buf!4342 thiss!1894)) (currentByte!8230 thiss!1894))) (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!8225 thiss!1894) nBits!600))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!600)))) (_2!7930 lt!261825)))))

(declare-fun moveBitIndex!0 (BitStream!6936 (_ BitVec 64)) tuple2!14644)

(assert (=> b!168508 (= lt!261825 (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun b!168509 () Bool)

(declare-fun array_inv!3631 (array!8768) Bool)

(assert (=> b!168509 (= e!117074 (array_inv!3631 (buf!4342 thiss!1894)))))

(declare-fun b!168510 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168510 (= e!117072 (not (invariant!0 (currentBit!8225 thiss!1894) (currentByte!8230 thiss!1894) (size!3890 (buf!4342 thiss!1894)))))))

(assert (= (and start!36780 res!140223) b!168505))

(assert (= (and b!168505 res!140224) b!168507))

(assert (= (and b!168507 c!8702) b!168508))

(assert (= (and b!168507 (not c!8702)) b!168506))

(assert (= (and b!168507 res!140225) b!168510))

(assert (= start!36780 b!168509))

(declare-fun m!268087 () Bool)

(assert (=> b!168506 m!268087))

(declare-fun m!268089 () Bool)

(assert (=> b!168506 m!268089))

(declare-fun m!268091 () Bool)

(assert (=> b!168506 m!268091))

(declare-fun m!268093 () Bool)

(assert (=> b!168510 m!268093))

(assert (=> b!168508 m!268087))

(assert (=> b!168508 m!268091))

(declare-fun m!268095 () Bool)

(assert (=> b!168508 m!268095))

(declare-fun m!268097 () Bool)

(assert (=> b!168505 m!268097))

(declare-fun m!268099 () Bool)

(assert (=> start!36780 m!268099))

(declare-fun m!268101 () Bool)

(assert (=> b!168509 m!268101))

(check-sat (not b!168509) (not b!168505) (not b!168508) (not start!36780) (not b!168510))
(check-sat)
(get-model)

(declare-fun d!59369 () Bool)

(assert (=> d!59369 (= (array_inv!3631 (buf!4342 thiss!1894)) (bvsge (size!3890 (buf!4342 thiss!1894)) #b00000000000000000000000000000000))))

(assert (=> b!168509 d!59369))

(declare-fun d!59371 () Bool)

(declare-fun lt!261857 () (_ BitVec 32))

(assert (=> d!59371 (= lt!261857 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!261862 () (_ BitVec 32))

(assert (=> d!59371 (= lt!261862 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun e!117096 () Bool)

(assert (=> d!59371 e!117096))

(declare-fun res!140243 () Bool)

(assert (=> d!59371 (=> (not res!140243) (not e!117096))))

(declare-fun moveBitIndexPrecond!0 (BitStream!6936 (_ BitVec 64)) Bool)

(assert (=> d!59371 (= res!140243 (moveBitIndexPrecond!0 thiss!1894 ((_ sign_extend 32) nBits!600)))))

(declare-fun Unit!11744 () Unit!11738)

(declare-fun Unit!11745 () Unit!11738)

(declare-fun Unit!11746 () Unit!11738)

(assert (=> d!59371 (= (moveBitIndex!0 thiss!1894 ((_ sign_extend 32) nBits!600)) (ite (bvslt (bvadd (currentBit!8225 thiss!1894) lt!261857) #b00000000000000000000000000000000) (tuple2!14645 Unit!11744 (BitStream!6937 (buf!4342 thiss!1894) (bvsub (bvadd (currentByte!8230 thiss!1894) lt!261862) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261857 (currentBit!8225 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8225 thiss!1894) lt!261857) #b00000000000000000000000000001000) (tuple2!14645 Unit!11745 (BitStream!6937 (buf!4342 thiss!1894) (bvadd (currentByte!8230 thiss!1894) lt!261862 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8225 thiss!1894) lt!261857) #b00000000000000000000000000001000))) (tuple2!14645 Unit!11746 (BitStream!6937 (buf!4342 thiss!1894) (bvadd (currentByte!8230 thiss!1894) lt!261862) (bvadd (currentBit!8225 thiss!1894) lt!261857))))))))

(declare-fun b!168537 () Bool)

(declare-fun e!117097 () Bool)

(assert (=> b!168537 (= e!117096 e!117097)))

(declare-fun res!140244 () Bool)

(assert (=> b!168537 (=> (not res!140244) (not e!117097))))

(declare-fun lt!261861 () (_ BitVec 64))

(declare-fun lt!261860 () tuple2!14644)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!168537 (= res!140244 (= (bvadd lt!261861 ((_ sign_extend 32) nBits!600)) (bitIndex!0 (size!3890 (buf!4342 (_2!7930 lt!261860))) (currentByte!8230 (_2!7930 lt!261860)) (currentBit!8225 (_2!7930 lt!261860)))))))

(assert (=> b!168537 (or (not (= (bvand lt!261861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand ((_ sign_extend 32) nBits!600) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!261861 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!261861 ((_ sign_extend 32) nBits!600)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!168537 (= lt!261861 (bitIndex!0 (size!3890 (buf!4342 thiss!1894)) (currentByte!8230 thiss!1894) (currentBit!8225 thiss!1894)))))

(declare-fun lt!261859 () (_ BitVec 32))

(declare-fun lt!261858 () (_ BitVec 32))

(declare-fun Unit!11750 () Unit!11738)

(declare-fun Unit!11751 () Unit!11738)

(declare-fun Unit!11752 () Unit!11738)

(assert (=> b!168537 (= lt!261860 (ite (bvslt (bvadd (currentBit!8225 thiss!1894) lt!261859) #b00000000000000000000000000000000) (tuple2!14645 Unit!11750 (BitStream!6937 (buf!4342 thiss!1894) (bvsub (bvadd (currentByte!8230 thiss!1894) lt!261858) #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000001000 lt!261859 (currentBit!8225 thiss!1894)))) (ite (bvsge (bvadd (currentBit!8225 thiss!1894) lt!261859) #b00000000000000000000000000001000) (tuple2!14645 Unit!11751 (BitStream!6937 (buf!4342 thiss!1894) (bvadd (currentByte!8230 thiss!1894) lt!261858 #b00000000000000000000000000000001) (bvsub (bvadd (currentBit!8225 thiss!1894) lt!261859) #b00000000000000000000000000001000))) (tuple2!14645 Unit!11752 (BitStream!6937 (buf!4342 thiss!1894) (bvadd (currentByte!8230 thiss!1894) lt!261858) (bvadd (currentBit!8225 thiss!1894) lt!261859))))))))

(assert (=> b!168537 (= lt!261859 ((_ extract 31 0) (bvsrem ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!168537 (= lt!261858 ((_ extract 31 0) (bvsdiv ((_ sign_extend 32) nBits!600) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!168538 () Bool)

(assert (=> b!168538 (= e!117097 (and (= (size!3890 (buf!4342 thiss!1894)) (size!3890 (buf!4342 (_2!7930 lt!261860)))) (= (buf!4342 thiss!1894) (buf!4342 (_2!7930 lt!261860)))))))

(assert (= (and d!59371 res!140243) b!168537))

(assert (= (and b!168537 res!140244) b!168538))

(declare-fun m!268119 () Bool)

(assert (=> d!59371 m!268119))

(declare-fun m!268121 () Bool)

(assert (=> b!168537 m!268121))

(declare-fun m!268123 () Bool)

(assert (=> b!168537 m!268123))

(assert (=> b!168508 d!59371))

(declare-fun d!59381 () Bool)

(assert (=> d!59381 (= (inv!12 thiss!1894) (invariant!0 (currentBit!8225 thiss!1894) (currentByte!8230 thiss!1894) (size!3890 (buf!4342 thiss!1894))))))

(declare-fun bs!14703 () Bool)

(assert (= bs!14703 d!59381))

(assert (=> bs!14703 m!268093))

(assert (=> start!36780 d!59381))

(declare-fun d!59383 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!59383 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3890 (buf!4342 thiss!1894))) ((_ sign_extend 32) (currentByte!8230 thiss!1894)) ((_ sign_extend 32) (currentBit!8225 thiss!1894)) ((_ sign_extend 32) nBits!600)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3890 (buf!4342 thiss!1894))) ((_ sign_extend 32) (currentByte!8230 thiss!1894)) ((_ sign_extend 32) (currentBit!8225 thiss!1894))) ((_ sign_extend 32) nBits!600)))))

(declare-fun bs!14704 () Bool)

(assert (= bs!14704 d!59383))

(declare-fun m!268125 () Bool)

(assert (=> bs!14704 m!268125))

(assert (=> b!168505 d!59383))

(declare-fun d!59385 () Bool)

(assert (=> d!59385 (= (invariant!0 (currentBit!8225 thiss!1894) (currentByte!8230 thiss!1894) (size!3890 (buf!4342 thiss!1894))) (and (bvsge (currentBit!8225 thiss!1894) #b00000000000000000000000000000000) (bvslt (currentBit!8225 thiss!1894) #b00000000000000000000000000001000) (bvsge (currentByte!8230 thiss!1894) #b00000000000000000000000000000000) (or (bvslt (currentByte!8230 thiss!1894) (size!3890 (buf!4342 thiss!1894))) (and (= (currentBit!8225 thiss!1894) #b00000000000000000000000000000000) (= (currentByte!8230 thiss!1894) (size!3890 (buf!4342 thiss!1894)))))))))

(assert (=> b!168510 d!59385))

(check-sat (not d!59383) (not d!59381) (not b!168537) (not d!59371))
