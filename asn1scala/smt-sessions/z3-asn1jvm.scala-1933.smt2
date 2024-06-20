; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50368 () Bool)

(assert start!50368)

(declare-fun res!197398 () Bool)

(declare-fun e!163304 () Bool)

(assert (=> start!50368 (=> (not res!197398) (not e!163304))))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(assert (=> start!50368 (= res!197398 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50368 e!163304))

(assert (=> start!50368 true))

(declare-datatypes ((array!12510 0))(
  ( (array!12511 (arr!6482 (Array (_ BitVec 32) (_ BitVec 8))) (size!5495 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9954 0))(
  ( (BitStream!9955 (buf!5970 array!12510) (currentByte!11093 (_ BitVec 32)) (currentBit!11088 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9954)

(declare-fun e!163302 () Bool)

(declare-fun inv!12 (BitStream!9954) Bool)

(assert (=> start!50368 (and (inv!12 thiss!1830) e!163302)))

(declare-fun b!236184 () Bool)

(declare-fun res!197399 () Bool)

(assert (=> b!236184 (=> (not res!197399) (not e!163304))))

(assert (=> b!236184 (= res!197399 (not (= nBits!581 i!752)))))

(declare-fun b!236185 () Bool)

(declare-fun array_inv!5236 (array!12510) Bool)

(assert (=> b!236185 (= e!163302 (array_inv!5236 (buf!5970 thiss!1830)))))

(declare-fun b!236186 () Bool)

(declare-fun res!197397 () Bool)

(assert (=> b!236186 (=> (not res!197397) (not e!163304))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236186 (= res!197397 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!236187 () Bool)

(declare-fun res!197400 () Bool)

(assert (=> b!236187 (=> (not res!197400) (not e!163304))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236187 (= res!197400 (validate_offset_bits!1 ((_ sign_extend 32) (size!5495 (buf!5970 thiss!1830))) ((_ sign_extend 32) (currentByte!11093 thiss!1830)) ((_ sign_extend 32) (currentBit!11088 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236188 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236188 (= e!163304 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5495 (buf!5970 thiss!1830))) ((_ sign_extend 32) (currentByte!11093 thiss!1830)) ((_ sign_extend 32) (currentBit!11088 thiss!1830)))))))

(declare-fun b!236189 () Bool)

(declare-fun res!197396 () Bool)

(assert (=> b!236189 (=> (not res!197396) (not e!163304))))

(assert (=> b!236189 (= res!197396 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50368 res!197398) b!236187))

(assert (= (and b!236187 res!197400) b!236186))

(assert (= (and b!236186 res!197397) b!236189))

(assert (= (and b!236189 res!197396) b!236184))

(assert (= (and b!236184 res!197399) b!236188))

(assert (= start!50368 b!236185))

(declare-fun m!358749 () Bool)

(assert (=> b!236187 m!358749))

(declare-fun m!358751 () Bool)

(assert (=> b!236189 m!358751))

(declare-fun m!358753 () Bool)

(assert (=> b!236186 m!358753))

(declare-fun m!358755 () Bool)

(assert (=> b!236185 m!358755))

(declare-fun m!358757 () Bool)

(assert (=> start!50368 m!358757))

(declare-fun m!358759 () Bool)

(assert (=> b!236188 m!358759))

(check-sat (not b!236185) (not b!236188) (not b!236189) (not b!236187) (not b!236186) (not start!50368))
(check-sat)
(get-model)

(declare-fun d!79686 () Bool)

(assert (=> d!79686 (= (array_inv!5236 (buf!5970 thiss!1830)) (bvsge (size!5495 (buf!5970 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!236185 d!79686))

(declare-fun d!79688 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!79688 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11088 thiss!1830) (currentByte!11093 thiss!1830) (size!5495 (buf!5970 thiss!1830))))))

(declare-fun bs!19898 () Bool)

(assert (= bs!19898 d!79688))

(declare-fun m!358773 () Bool)

(assert (=> bs!19898 m!358773))

(assert (=> start!50368 d!79688))

(declare-fun d!79690 () Bool)

(assert (=> d!79690 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!236189 d!79690))

(declare-fun d!79692 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79692 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5495 (buf!5970 thiss!1830))) ((_ sign_extend 32) (currentByte!11093 thiss!1830)) ((_ sign_extend 32) (currentBit!11088 thiss!1830))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5495 (buf!5970 thiss!1830))) ((_ sign_extend 32) (currentByte!11093 thiss!1830)) ((_ sign_extend 32) (currentBit!11088 thiss!1830))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!19899 () Bool)

(assert (= bs!19899 d!79692))

(declare-fun m!358775 () Bool)

(assert (=> bs!19899 m!358775))

(assert (=> b!236188 d!79692))

(declare-fun d!79696 () Bool)

(assert (=> d!79696 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5495 (buf!5970 thiss!1830))) ((_ sign_extend 32) (currentByte!11093 thiss!1830)) ((_ sign_extend 32) (currentBit!11088 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5495 (buf!5970 thiss!1830))) ((_ sign_extend 32) (currentByte!11093 thiss!1830)) ((_ sign_extend 32) (currentBit!11088 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19901 () Bool)

(assert (= bs!19901 d!79696))

(assert (=> bs!19901 m!358775))

(assert (=> b!236187 d!79696))

(declare-fun d!79700 () Bool)

(assert (=> d!79700 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!236186 d!79700))

(check-sat (not d!79692) (not d!79688) (not d!79696))
(check-sat)
