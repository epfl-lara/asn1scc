; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18380 () Bool)

(assert start!18380)

(declare-fun b!91160 () Bool)

(declare-fun res!75248 () Bool)

(declare-fun e!59958 () Bool)

(assert (=> b!91160 (=> (not res!75248) (not e!59958))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!91160 (= res!75248 (bvslt i!576 nBits!336))))

(declare-fun b!91161 () Bool)

(declare-fun res!75235 () Bool)

(declare-fun e!59952 () Bool)

(assert (=> b!91161 (=> (not res!75235) (not e!59952))))

(declare-datatypes ((array!4264 0))(
  ( (array!4265 (arr!2558 (Array (_ BitVec 32) (_ BitVec 8))) (size!1921 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3404 0))(
  ( (BitStream!3405 (buf!2311 array!4264) (currentByte!4601 (_ BitVec 32)) (currentBit!4596 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3404)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91161 (= res!75235 (invariant!0 (currentBit!4596 thiss!1151) (currentByte!4601 thiss!1151) (size!1921 (buf!2311 thiss!1151))))))

(declare-fun b!91162 () Bool)

(declare-fun res!75240 () Bool)

(assert (=> b!91162 (=> (not res!75240) (not e!59952))))

(declare-fun thiss!1152 () BitStream!3404)

(assert (=> b!91162 (= res!75240 (invariant!0 (currentBit!4596 thiss!1152) (currentByte!4601 thiss!1152) (size!1921 (buf!2311 thiss!1152))))))

(declare-fun b!91163 () Bool)

(assert (=> b!91163 (= e!59952 e!59958)))

(declare-fun res!75242 () Bool)

(assert (=> b!91163 (=> (not res!75242) (not e!59958))))

(declare-fun lt!137659 () (_ BitVec 64))

(declare-fun lt!137658 () (_ BitVec 64))

(assert (=> b!91163 (= res!75242 (= lt!137658 (bvadd lt!137659 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91163 (= lt!137658 (bitIndex!0 (size!1921 (buf!2311 thiss!1152)) (currentByte!4601 thiss!1152) (currentBit!4596 thiss!1152)))))

(assert (=> b!91163 (= lt!137659 (bitIndex!0 (size!1921 (buf!2311 thiss!1151)) (currentByte!4601 thiss!1151) (currentBit!4596 thiss!1151)))))

(declare-fun b!91164 () Bool)

(declare-fun res!75247 () Bool)

(declare-fun e!59959 () Bool)

(assert (=> b!91164 (=> res!75247 e!59959)))

(declare-datatypes ((Unit!5834 0))(
  ( (Unit!5835) )
))
(declare-datatypes ((tuple2!7584 0))(
  ( (tuple2!7585 (_1!4037 Unit!5834) (_2!4037 BitStream!3404)) )
))
(declare-fun lt!137656 () tuple2!7584)

(assert (=> b!91164 (= res!75247 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1921 (buf!2311 (_2!4037 lt!137656))) (size!1921 (buf!2311 thiss!1151))))))))

(declare-fun b!91165 () Bool)

(declare-fun res!75246 () Bool)

(assert (=> b!91165 (=> res!75246 e!59959)))

(assert (=> b!91165 (= res!75246 (not (= (bitIndex!0 (size!1921 (buf!2311 (_2!4037 lt!137656))) (currentByte!4601 (_2!4037 lt!137656)) (currentBit!4596 (_2!4037 lt!137656))) (bvadd lt!137659 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!91166 () Bool)

(declare-fun e!59956 () Bool)

(declare-fun array_inv!1767 (array!4264) Bool)

(assert (=> b!91166 (= e!59956 (array_inv!1767 (buf!2311 thiss!1152)))))

(declare-fun b!91167 () Bool)

(declare-fun e!59954 () Bool)

(declare-datatypes ((tuple2!7586 0))(
  ( (tuple2!7587 (_1!4038 BitStream!3404) (_2!4038 Bool)) )
))
(declare-fun lt!137657 () tuple2!7586)

(declare-fun lt!137661 () (_ BitVec 64))

(assert (=> b!91167 (= e!59954 (= (bitIndex!0 (size!1921 (buf!2311 (_1!4038 lt!137657))) (currentByte!4601 (_1!4038 lt!137657)) (currentBit!4596 (_1!4038 lt!137657))) lt!137661))))

(declare-fun res!75241 () Bool)

(assert (=> start!18380 (=> (not res!75241) (not e!59952))))

(assert (=> start!18380 (= res!75241 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18380 e!59952))

(declare-fun inv!12 (BitStream!3404) Bool)

(assert (=> start!18380 (and (inv!12 thiss!1152) e!59956)))

(declare-fun e!59957 () Bool)

(assert (=> start!18380 (and (inv!12 thiss!1151) e!59957)))

(assert (=> start!18380 true))

(declare-fun b!91168 () Bool)

(declare-fun res!75245 () Bool)

(declare-fun e!59953 () Bool)

(assert (=> b!91168 (=> (not res!75245) (not e!59953))))

(declare-fun isPrefixOf!0 (BitStream!3404 BitStream!3404) Bool)

(assert (=> b!91168 (= res!75245 (isPrefixOf!0 thiss!1152 (_2!4037 lt!137656)))))

(declare-fun b!91169 () Bool)

(declare-fun e!59955 () Bool)

(assert (=> b!91169 (= e!59955 e!59953)))

(declare-fun res!75243 () Bool)

(assert (=> b!91169 (=> (not res!75243) (not e!59953))))

(assert (=> b!91169 (= res!75243 (= lt!137661 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137658)))))

(assert (=> b!91169 (= lt!137661 (bitIndex!0 (size!1921 (buf!2311 (_2!4037 lt!137656))) (currentByte!4601 (_2!4037 lt!137656)) (currentBit!4596 (_2!4037 lt!137656))))))

(declare-fun b!91170 () Bool)

(declare-fun res!75237 () Bool)

(assert (=> b!91170 (=> (not res!75237) (not e!59952))))

(assert (=> b!91170 (= res!75237 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!91171 () Bool)

(assert (=> b!91171 (= e!59958 (not e!59959))))

(declare-fun res!75239 () Bool)

(assert (=> b!91171 (=> res!75239 e!59959)))

(assert (=> b!91171 (= res!75239 (not (invariant!0 (currentBit!4596 (_2!4037 lt!137656)) (currentByte!4601 (_2!4037 lt!137656)) (size!1921 (buf!2311 (_2!4037 lt!137656))))))))

(assert (=> b!91171 e!59955))

(declare-fun res!75238 () Bool)

(assert (=> b!91171 (=> (not res!75238) (not e!59955))))

(assert (=> b!91171 (= res!75238 (= (size!1921 (buf!2311 thiss!1152)) (size!1921 (buf!2311 (_2!4037 lt!137656)))))))

(declare-fun lt!137660 () Bool)

(declare-fun appendBit!0 (BitStream!3404 Bool) tuple2!7584)

(assert (=> b!91171 (= lt!137656 (appendBit!0 thiss!1152 lt!137660))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!91171 (= lt!137660 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!91172 () Bool)

(assert (=> b!91172 (= e!59959 (or (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!576) #b10000000000000000000000000000000)) (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)) #b10000000000000000000000000000000))))))

(declare-fun b!91173 () Bool)

(assert (=> b!91173 (= e!59957 (array_inv!1767 (buf!2311 thiss!1151)))))

(declare-fun b!91174 () Bool)

(declare-fun res!75250 () Bool)

(assert (=> b!91174 (=> (not res!75250) (not e!59952))))

(assert (=> b!91174 (= res!75250 (and (bvsle i!576 nBits!336) (= (size!1921 (buf!2311 thiss!1152)) (size!1921 (buf!2311 thiss!1151)))))))

(declare-fun b!91175 () Bool)

(declare-fun res!75244 () Bool)

(assert (=> b!91175 (=> (not res!75244) (not e!59952))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91175 (= res!75244 (validate_offset_bits!1 ((_ sign_extend 32) (size!1921 (buf!2311 thiss!1151))) ((_ sign_extend 32) (currentByte!4601 thiss!1151)) ((_ sign_extend 32) (currentBit!4596 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!91176 () Bool)

(declare-fun res!75249 () Bool)

(assert (=> b!91176 (=> (not res!75249) (not e!59958))))

(assert (=> b!91176 (= res!75249 (validate_offset_bits!1 ((_ sign_extend 32) (size!1921 (buf!2311 thiss!1152))) ((_ sign_extend 32) (currentByte!4601 thiss!1152)) ((_ sign_extend 32) (currentBit!4596 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!91177 () Bool)

(assert (=> b!91177 (= e!59953 e!59954)))

(declare-fun res!75236 () Bool)

(assert (=> b!91177 (=> (not res!75236) (not e!59954))))

(assert (=> b!91177 (= res!75236 (and (= (_2!4038 lt!137657) lt!137660) (= (_1!4038 lt!137657) (_2!4037 lt!137656))))))

(declare-fun readBitPure!0 (BitStream!3404) tuple2!7586)

(declare-fun readerFrom!0 (BitStream!3404 (_ BitVec 32) (_ BitVec 32)) BitStream!3404)

(assert (=> b!91177 (= lt!137657 (readBitPure!0 (readerFrom!0 (_2!4037 lt!137656) (currentBit!4596 thiss!1152) (currentByte!4601 thiss!1152))))))

(assert (= (and start!18380 res!75241) b!91175))

(assert (= (and b!91175 res!75244) b!91161))

(assert (= (and b!91161 res!75235) b!91170))

(assert (= (and b!91170 res!75237) b!91162))

(assert (= (and b!91162 res!75240) b!91174))

(assert (= (and b!91174 res!75250) b!91163))

(assert (= (and b!91163 res!75242) b!91176))

(assert (= (and b!91176 res!75249) b!91160))

(assert (= (and b!91160 res!75248) b!91171))

(assert (= (and b!91171 res!75238) b!91169))

(assert (= (and b!91169 res!75243) b!91168))

(assert (= (and b!91168 res!75245) b!91177))

(assert (= (and b!91177 res!75236) b!91167))

(assert (= (and b!91171 (not res!75239)) b!91164))

(assert (= (and b!91164 (not res!75247)) b!91165))

(assert (= (and b!91165 (not res!75246)) b!91172))

(assert (= start!18380 b!91166))

(assert (= start!18380 b!91173))

(declare-fun m!135397 () Bool)

(assert (=> b!91177 m!135397))

(assert (=> b!91177 m!135397))

(declare-fun m!135399 () Bool)

(assert (=> b!91177 m!135399))

(declare-fun m!135401 () Bool)

(assert (=> b!91166 m!135401))

(declare-fun m!135403 () Bool)

(assert (=> start!18380 m!135403))

(declare-fun m!135405 () Bool)

(assert (=> start!18380 m!135405))

(declare-fun m!135407 () Bool)

(assert (=> b!91175 m!135407))

(declare-fun m!135409 () Bool)

(assert (=> b!91168 m!135409))

(declare-fun m!135411 () Bool)

(assert (=> b!91171 m!135411))

(declare-fun m!135413 () Bool)

(assert (=> b!91171 m!135413))

(declare-fun m!135415 () Bool)

(assert (=> b!91162 m!135415))

(declare-fun m!135417 () Bool)

(assert (=> b!91167 m!135417))

(declare-fun m!135419 () Bool)

(assert (=> b!91169 m!135419))

(declare-fun m!135421 () Bool)

(assert (=> b!91161 m!135421))

(declare-fun m!135423 () Bool)

(assert (=> b!91173 m!135423))

(declare-fun m!135425 () Bool)

(assert (=> b!91163 m!135425))

(declare-fun m!135427 () Bool)

(assert (=> b!91163 m!135427))

(assert (=> b!91165 m!135419))

(declare-fun m!135429 () Bool)

(assert (=> b!91176 m!135429))

(push 1)

(assert (not start!18380))

(assert (not b!91177))

(assert (not b!91169))

(assert (not b!91168))

(assert (not b!91166))

(assert (not b!91162))

(assert (not b!91175))

(assert (not b!91176))

(assert (not b!91163))

(assert (not b!91167))

(assert (not b!91161))

(assert (not b!91171))

(assert (not b!91173))

(assert (not b!91165))

(check-sat)

(pop 1)

(push 1)

(check-sat)

