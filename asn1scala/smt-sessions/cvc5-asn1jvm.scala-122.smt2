; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2918 () Bool)

(assert start!2918)

(declare-fun b!13501 () Bool)

(declare-fun res!12808 () Bool)

(declare-fun e!8284 () Bool)

(assert (=> b!13501 (=> (not res!12808) (not e!8284))))

(declare-datatypes ((array!759 0))(
  ( (array!760 (arr!757 (Array (_ BitVec 32) (_ BitVec 8))) (size!328 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!616 0))(
  ( (BitStream!617 (buf!679 array!759) (currentByte!1787 (_ BitVec 32)) (currentBit!1782 (_ BitVec 32))) )
))
(declare-fun thiss!957 () BitStream!616)

(declare-datatypes ((Unit!1121 0))(
  ( (Unit!1122) )
))
(declare-datatypes ((tuple2!1598 0))(
  ( (tuple2!1599 (_1!854 Unit!1121) (_2!854 BitStream!616)) )
))
(declare-fun lt!21185 () tuple2!1598)

(declare-fun isPrefixOf!0 (BitStream!616 BitStream!616) Bool)

(assert (=> b!13501 (= res!12808 (isPrefixOf!0 thiss!957 (_2!854 lt!21185)))))

(declare-fun b!13502 () Bool)

(declare-fun e!8285 () Bool)

(assert (=> b!13502 (= e!8285 e!8284)))

(declare-fun res!12810 () Bool)

(assert (=> b!13502 (=> (not res!12810) (not e!8284))))

(declare-fun lt!21188 () (_ BitVec 64))

(declare-fun lt!21186 () (_ BitVec 64))

(assert (=> b!13502 (= res!12810 (= lt!21188 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21186)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13502 (= lt!21188 (bitIndex!0 (size!328 (buf!679 (_2!854 lt!21185))) (currentByte!1787 (_2!854 lt!21185)) (currentBit!1782 (_2!854 lt!21185))))))

(assert (=> b!13502 (= lt!21186 (bitIndex!0 (size!328 (buf!679 thiss!957)) (currentByte!1787 thiss!957) (currentBit!1782 thiss!957)))))

(declare-fun b!13503 () Bool)

(declare-fun e!8283 () Bool)

(declare-datatypes ((tuple2!1600 0))(
  ( (tuple2!1601 (_1!855 BitStream!616) (_2!855 Bool)) )
))
(declare-fun lt!21187 () tuple2!1600)

(assert (=> b!13503 (= e!8283 (= (bitIndex!0 (size!328 (buf!679 (_1!855 lt!21187))) (currentByte!1787 (_1!855 lt!21187)) (currentBit!1782 (_1!855 lt!21187))) lt!21188))))

(declare-fun b!13504 () Bool)

(declare-fun e!8280 () Bool)

(declare-fun array_inv!317 (array!759) Bool)

(assert (=> b!13504 (= e!8280 (array_inv!317 (buf!679 thiss!957)))))

(declare-fun b!13505 () Bool)

(declare-fun e!8281 () Bool)

(declare-fun e!8282 () Bool)

(assert (=> b!13505 (= e!8281 (not e!8282))))

(declare-fun res!12809 () Bool)

(assert (=> b!13505 (=> res!12809 e!8282)))

(assert (=> b!13505 (= res!12809 (not (= (size!328 (buf!679 (_2!854 lt!21185))) (size!328 (buf!679 thiss!957)))))))

(assert (=> b!13505 e!8285))

(declare-fun res!12812 () Bool)

(assert (=> b!13505 (=> (not res!12812) (not e!8285))))

(assert (=> b!13505 (= res!12812 (= (size!328 (buf!679 thiss!957)) (size!328 (buf!679 (_2!854 lt!21185)))))))

(declare-fun appendBit!0 (BitStream!616 Bool) tuple2!1598)

(assert (=> b!13505 (= lt!21185 (appendBit!0 thiss!957 false))))

(declare-fun res!12807 () Bool)

(assert (=> start!2918 (=> (not res!12807) (not e!8281))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!2918 (= res!12807 (validate_offset_bit!0 ((_ sign_extend 32) (size!328 (buf!679 thiss!957))) ((_ sign_extend 32) (currentByte!1787 thiss!957)) ((_ sign_extend 32) (currentBit!1782 thiss!957))))))

(assert (=> start!2918 e!8281))

(declare-fun inv!12 (BitStream!616) Bool)

(assert (=> start!2918 (and (inv!12 thiss!957) e!8280)))

(declare-fun b!13506 () Bool)

(assert (=> b!13506 (= e!8284 e!8283)))

(declare-fun res!12813 () Bool)

(assert (=> b!13506 (=> (not res!12813) (not e!8283))))

(assert (=> b!13506 (= res!12813 (and (not (_2!855 lt!21187)) (= (_1!855 lt!21187) (_2!854 lt!21185))))))

(declare-fun readBitPure!0 (BitStream!616) tuple2!1600)

(declare-fun readerFrom!0 (BitStream!616 (_ BitVec 32) (_ BitVec 32)) BitStream!616)

(assert (=> b!13506 (= lt!21187 (readBitPure!0 (readerFrom!0 (_2!854 lt!21185) (currentBit!1782 thiss!957) (currentByte!1787 thiss!957))))))

(declare-fun b!13507 () Bool)

(declare-fun res!12814 () Bool)

(assert (=> b!13507 (=> res!12814 e!8282)))

(assert (=> b!13507 (= res!12814 (not (isPrefixOf!0 thiss!957 (_2!854 lt!21185))))))

(declare-fun b!13508 () Bool)

(declare-fun res!12811 () Bool)

(assert (=> b!13508 (=> res!12811 e!8282)))

(assert (=> b!13508 (= res!12811 (not (= (bitIndex!0 (size!328 (buf!679 (_2!854 lt!21185))) (currentByte!1787 (_2!854 lt!21185)) (currentBit!1782 (_2!854 lt!21185))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!328 (buf!679 thiss!957)) (currentByte!1787 thiss!957) (currentBit!1782 thiss!957))))))))

(declare-fun b!13509 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!13509 (= e!8282 (invariant!0 (currentBit!1782 (_2!854 lt!21185)) (currentByte!1787 (_2!854 lt!21185)) (size!328 (buf!679 (_2!854 lt!21185)))))))

(assert (= (and start!2918 res!12807) b!13505))

(assert (= (and b!13505 res!12812) b!13502))

(assert (= (and b!13502 res!12810) b!13501))

(assert (= (and b!13501 res!12808) b!13506))

(assert (= (and b!13506 res!12813) b!13503))

(assert (= (and b!13505 (not res!12809)) b!13508))

(assert (= (and b!13508 (not res!12811)) b!13507))

(assert (= (and b!13507 (not res!12814)) b!13509))

(assert (= start!2918 b!13504))

(declare-fun m!20115 () Bool)

(assert (=> start!2918 m!20115))

(declare-fun m!20117 () Bool)

(assert (=> start!2918 m!20117))

(declare-fun m!20119 () Bool)

(assert (=> b!13504 m!20119))

(declare-fun m!20121 () Bool)

(assert (=> b!13507 m!20121))

(assert (=> b!13501 m!20121))

(declare-fun m!20123 () Bool)

(assert (=> b!13503 m!20123))

(declare-fun m!20125 () Bool)

(assert (=> b!13509 m!20125))

(declare-fun m!20127 () Bool)

(assert (=> b!13506 m!20127))

(assert (=> b!13506 m!20127))

(declare-fun m!20129 () Bool)

(assert (=> b!13506 m!20129))

(declare-fun m!20131 () Bool)

(assert (=> b!13505 m!20131))

(declare-fun m!20133 () Bool)

(assert (=> b!13502 m!20133))

(declare-fun m!20135 () Bool)

(assert (=> b!13502 m!20135))

(assert (=> b!13508 m!20133))

(assert (=> b!13508 m!20135))

(push 1)

(assert (not b!13504))

(assert (not start!2918))

(assert (not b!13507))

(assert (not b!13503))

(assert (not b!13508))

(assert (not b!13502))

(assert (not b!13509))

(assert (not b!13501))

(assert (not b!13506))

(assert (not b!13505))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4368 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4368 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!328 (buf!679 thiss!957))) ((_ sign_extend 32) (currentByte!1787 thiss!957)) ((_ sign_extend 32) (currentBit!1782 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!328 (buf!679 thiss!957))) ((_ sign_extend 32) (currentByte!1787 thiss!957)) ((_ sign_extend 32) (currentBit!1782 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1218 () Bool)

(assert (= bs!1218 d!4368))

(declare-fun m!20185 () Bool)

(assert (=> bs!1218 m!20185))

(assert (=> start!2918 d!4368))

(declare-fun d!4372 () Bool)

(assert (=> d!4372 (= (inv!12 thiss!957) (invariant!0 (currentBit!1782 thiss!957) (currentByte!1787 thiss!957) (size!328 (buf!679 thiss!957))))))

(declare-fun bs!1219 () Bool)

(assert (= bs!1219 d!4372))

(declare-fun m!20187 () Bool)

(assert (=> bs!1219 m!20187))

(assert (=> start!2918 d!4372))

(declare-fun b!13592 () Bool)

(declare-fun res!12891 () Bool)

(declare-fun e!8343 () Bool)

(assert (=> b!13592 (=> (not res!12891) (not e!8343))))

(declare-fun lt!21254 () (_ BitVec 64))

(declare-fun lt!21251 () (_ BitVec 64))

(declare-fun lt!21253 () tuple2!1598)

(assert (=> b!13592 (= res!12891 (= (bitIndex!0 (size!328 (buf!679 (_2!854 lt!21253))) (currentByte!1787 (_2!854 lt!21253)) (currentBit!1782 (_2!854 lt!21253))) (bvadd lt!21254 lt!21251)))))

(assert (=> b!13592 (or (not (= (bvand lt!21254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21251 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21254 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21254 lt!21251) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!13592 (= lt!21251 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!13592 (= lt!21254 (bitIndex!0 (size!328 (buf!679 thiss!957)) (currentByte!1787 thiss!957) (currentBit!1782 thiss!957)))))

(declare-fun b!13595 () Bool)

(declare-fun e!8344 () Bool)

(declare-fun lt!21252 () tuple2!1600)

(assert (=> b!13595 (= e!8344 (= (bitIndex!0 (size!328 (buf!679 (_1!855 lt!21252))) (currentByte!1787 (_1!855 lt!21252)) (currentBit!1782 (_1!855 lt!21252))) (bitIndex!0 (size!328 (buf!679 (_2!854 lt!21253))) (currentByte!1787 (_2!854 lt!21253)) (currentBit!1782 (_2!854 lt!21253)))))))

(declare-fun d!4374 () Bool)

(assert (=> d!4374 e!8343))

(declare-fun res!12892 () Bool)

(assert (=> d!4374 (=> (not res!12892) (not e!8343))))

(assert (=> d!4374 (= res!12892 (= (size!328 (buf!679 thiss!957)) (size!328 (buf!679 (_2!854 lt!21253)))))))

(declare-fun choose!16 (BitStream!616 Bool) tuple2!1598)

(assert (=> d!4374 (= lt!21253 (choose!16 thiss!957 false))))

(assert (=> d!4374 (validate_offset_bit!0 ((_ sign_extend 32) (size!328 (buf!679 thiss!957))) ((_ sign_extend 32) (currentByte!1787 thiss!957)) ((_ sign_extend 32) (currentBit!1782 thiss!957)))))

(assert (=> d!4374 (= (appendBit!0 thiss!957 false) lt!21253)))

(declare-fun b!13594 () Bool)

(assert (=> b!13594 (= e!8343 e!8344)))

(declare-fun res!12893 () Bool)

(assert (=> b!13594 (=> (not res!12893) (not e!8344))))

(assert (=> b!13594 (= res!12893 (and (= (_2!855 lt!21252) false) (= (_1!855 lt!21252) (_2!854 lt!21253))))))

(assert (=> b!13594 (= lt!21252 (readBitPure!0 (readerFrom!0 (_2!854 lt!21253) (currentBit!1782 thiss!957) (currentByte!1787 thiss!957))))))

(declare-fun b!13593 () Bool)

(declare-fun res!12890 () Bool)

(assert (=> b!13593 (=> (not res!12890) (not e!8343))))

(assert (=> b!13593 (= res!12890 (isPrefixOf!0 thiss!957 (_2!854 lt!21253)))))

(assert (= (and d!4374 res!12892) b!13592))

(assert (= (and b!13592 res!12891) b!13593))

(assert (= (and b!13593 res!12890) b!13594))

(assert (= (and b!13594 res!12893) b!13595))

(declare-fun m!20201 () Bool)

(assert (=> b!13592 m!20201))

(assert (=> b!13592 m!20135))

(declare-fun m!20203 () Bool)

(assert (=> d!4374 m!20203))

(assert (=> d!4374 m!20115))

(declare-fun m!20205 () Bool)

(assert (=> b!13593 m!20205))

(declare-fun m!20207 () Bool)

(assert (=> b!13594 m!20207))

(assert (=> b!13594 m!20207))

(declare-fun m!20209 () Bool)

(assert (=> b!13594 m!20209))

(declare-fun m!20211 () Bool)

(assert (=> b!13595 m!20211))

(assert (=> b!13595 m!20201))

(assert (=> b!13505 d!4374))

(declare-fun d!4390 () Bool)

(declare-datatypes ((tuple2!1610 0))(
  ( (tuple2!1611 (_1!860 Bool) (_2!860 BitStream!616)) )
))
(declare-fun lt!21265 () tuple2!1610)

(declare-fun readBit!0 (BitStream!616) tuple2!1610)

(assert (=> d!4390 (= lt!21265 (readBit!0 (readerFrom!0 (_2!854 lt!21185) (currentBit!1782 thiss!957) (currentByte!1787 thiss!957))))))

(assert (=> d!4390 (= (readBitPure!0 (readerFrom!0 (_2!854 lt!21185) (currentBit!1782 thiss!957) (currentByte!1787 thiss!957))) (tuple2!1601 (_2!860 lt!21265) (_1!860 lt!21265)))))

(declare-fun bs!1222 () Bool)

(assert (= bs!1222 d!4390))

(assert (=> bs!1222 m!20127))

(declare-fun m!20213 () Bool)

(assert (=> bs!1222 m!20213))

(assert (=> b!13506 d!4390))

(declare-fun d!4392 () Bool)

(declare-fun e!8357 () Bool)

(assert (=> d!4392 e!8357))

(declare-fun res!12917 () Bool)

(assert (=> d!4392 (=> (not res!12917) (not e!8357))))

(assert (=> d!4392 (= res!12917 (invariant!0 (currentBit!1782 (_2!854 lt!21185)) (currentByte!1787 (_2!854 lt!21185)) (size!328 (buf!679 (_2!854 lt!21185)))))))

(assert (=> d!4392 (= (readerFrom!0 (_2!854 lt!21185) (currentBit!1782 thiss!957) (currentByte!1787 thiss!957)) (BitStream!617 (buf!679 (_2!854 lt!21185)) (currentByte!1787 thiss!957) (currentBit!1782 thiss!957)))))

(declare-fun b!13620 () Bool)

(assert (=> b!13620 (= e!8357 (invariant!0 (currentBit!1782 thiss!957) (currentByte!1787 thiss!957) (size!328 (buf!679 (_2!854 lt!21185)))))))

(assert (= (and d!4392 res!12917) b!13620))

(assert (=> d!4392 m!20125))

(declare-fun m!20227 () Bool)

(assert (=> b!13620 m!20227))

(assert (=> b!13506 d!4392))

(declare-fun d!4398 () Bool)

(declare-fun res!12930 () Bool)

(declare-fun e!8364 () Bool)

(assert (=> d!4398 (=> (not res!12930) (not e!8364))))

(assert (=> d!4398 (= res!12930 (= (size!328 (buf!679 thiss!957)) (size!328 (buf!679 (_2!854 lt!21185)))))))

(assert (=> d!4398 (= (isPrefixOf!0 thiss!957 (_2!854 lt!21185)) e!8364)))

(declare-fun b!13631 () Bool)

(declare-fun res!12929 () Bool)

(assert (=> b!13631 (=> (not res!12929) (not e!8364))))

(assert (=> b!13631 (= res!12929 (bvsle (bitIndex!0 (size!328 (buf!679 thiss!957)) (currentByte!1787 thiss!957) (currentBit!1782 thiss!957)) (bitIndex!0 (size!328 (buf!679 (_2!854 lt!21185))) (currentByte!1787 (_2!854 lt!21185)) (currentBit!1782 (_2!854 lt!21185)))))))

(declare-fun b!13632 () Bool)

(declare-fun e!8365 () Bool)

(assert (=> b!13632 (= e!8364 e!8365)))

(declare-fun res!12928 () Bool)

(assert (=> b!13632 (=> res!12928 e!8365)))

(assert (=> b!13632 (= res!12928 (= (size!328 (buf!679 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!13633 () Bool)

(declare-fun arrayBitRangesEq!0 (array!759 array!759 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13633 (= e!8365 (arrayBitRangesEq!0 (buf!679 thiss!957) (buf!679 (_2!854 lt!21185)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!328 (buf!679 thiss!957)) (currentByte!1787 thiss!957) (currentBit!1782 thiss!957))))))

(assert (= (and d!4398 res!12930) b!13631))

(assert (= (and b!13631 res!12929) b!13632))

(assert (= (and b!13632 (not res!12928)) b!13633))

(assert (=> b!13631 m!20135))

(assert (=> b!13631 m!20133))

(assert (=> b!13633 m!20135))

(assert (=> b!13633 m!20135))

(declare-fun m!20241 () Bool)

(assert (=> b!13633 m!20241))

(assert (=> b!13501 d!4398))

(assert (=> b!13507 d!4398))

(declare-fun d!4404 () Bool)

(declare-fun e!8378 () Bool)

(assert (=> d!4404 e!8378))

(declare-fun res!12952 () Bool)

(assert (=> d!4404 (=> (not res!12952) (not e!8378))))

(declare-fun lt!21328 () (_ BitVec 64))

(declare-fun lt!21327 () (_ BitVec 64))

(declare-fun lt!21326 () (_ BitVec 64))

(assert (=> d!4404 (= res!12952 (= lt!21327 (bvsub lt!21328 lt!21326)))))

(assert (=> d!4404 (or (= (bvand lt!21328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21326 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21328 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21328 lt!21326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4404 (= lt!21326 (remainingBits!0 ((_ sign_extend 32) (size!328 (buf!679 (_2!854 lt!21185)))) ((_ sign_extend 32) (currentByte!1787 (_2!854 lt!21185))) ((_ sign_extend 32) (currentBit!1782 (_2!854 lt!21185)))))))

(declare-fun lt!21329 () (_ BitVec 64))

(declare-fun lt!21325 () (_ BitVec 64))

(assert (=> d!4404 (= lt!21328 (bvmul lt!21329 lt!21325))))

(assert (=> d!4404 (or (= lt!21329 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21325 (bvsdiv (bvmul lt!21329 lt!21325) lt!21329)))))

(assert (=> d!4404 (= lt!21325 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4404 (= lt!21329 ((_ sign_extend 32) (size!328 (buf!679 (_2!854 lt!21185)))))))

(assert (=> d!4404 (= lt!21327 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1787 (_2!854 lt!21185))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1782 (_2!854 lt!21185)))))))

(assert (=> d!4404 (invariant!0 (currentBit!1782 (_2!854 lt!21185)) (currentByte!1787 (_2!854 lt!21185)) (size!328 (buf!679 (_2!854 lt!21185))))))

(assert (=> d!4404 (= (bitIndex!0 (size!328 (buf!679 (_2!854 lt!21185))) (currentByte!1787 (_2!854 lt!21185)) (currentBit!1782 (_2!854 lt!21185))) lt!21327)))

(declare-fun b!13652 () Bool)

(declare-fun res!12951 () Bool)

(assert (=> b!13652 (=> (not res!12951) (not e!8378))))

(assert (=> b!13652 (= res!12951 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21327))))

(declare-fun b!13653 () Bool)

(declare-fun lt!21324 () (_ BitVec 64))

(assert (=> b!13653 (= e!8378 (bvsle lt!21327 (bvmul lt!21324 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13653 (or (= lt!21324 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21324 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21324)))))

(assert (=> b!13653 (= lt!21324 ((_ sign_extend 32) (size!328 (buf!679 (_2!854 lt!21185)))))))

(assert (= (and d!4404 res!12952) b!13652))

(assert (= (and b!13652 res!12951) b!13653))

(declare-fun m!20253 () Bool)

(assert (=> d!4404 m!20253))

(assert (=> d!4404 m!20125))

(assert (=> b!13502 d!4404))

(declare-fun d!4418 () Bool)

(declare-fun e!8379 () Bool)

(assert (=> d!4418 e!8379))

(declare-fun res!12954 () Bool)

(assert (=> d!4418 (=> (not res!12954) (not e!8379))))

(declare-fun lt!21332 () (_ BitVec 64))

(declare-fun lt!21333 () (_ BitVec 64))

(declare-fun lt!21334 () (_ BitVec 64))

(assert (=> d!4418 (= res!12954 (= lt!21333 (bvsub lt!21334 lt!21332)))))

(assert (=> d!4418 (or (= (bvand lt!21334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21332 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21334 lt!21332) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4418 (= lt!21332 (remainingBits!0 ((_ sign_extend 32) (size!328 (buf!679 thiss!957))) ((_ sign_extend 32) (currentByte!1787 thiss!957)) ((_ sign_extend 32) (currentBit!1782 thiss!957))))))

(declare-fun lt!21335 () (_ BitVec 64))

(declare-fun lt!21331 () (_ BitVec 64))

(assert (=> d!4418 (= lt!21334 (bvmul lt!21335 lt!21331))))

(assert (=> d!4418 (or (= lt!21335 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21331 (bvsdiv (bvmul lt!21335 lt!21331) lt!21335)))))

(assert (=> d!4418 (= lt!21331 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4418 (= lt!21335 ((_ sign_extend 32) (size!328 (buf!679 thiss!957))))))

(assert (=> d!4418 (= lt!21333 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1787 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1782 thiss!957))))))

(assert (=> d!4418 (invariant!0 (currentBit!1782 thiss!957) (currentByte!1787 thiss!957) (size!328 (buf!679 thiss!957)))))

(assert (=> d!4418 (= (bitIndex!0 (size!328 (buf!679 thiss!957)) (currentByte!1787 thiss!957) (currentBit!1782 thiss!957)) lt!21333)))

(declare-fun b!13654 () Bool)

(declare-fun res!12953 () Bool)

(assert (=> b!13654 (=> (not res!12953) (not e!8379))))

(assert (=> b!13654 (= res!12953 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21333))))

(declare-fun b!13655 () Bool)

(declare-fun lt!21330 () (_ BitVec 64))

(assert (=> b!13655 (= e!8379 (bvsle lt!21333 (bvmul lt!21330 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13655 (or (= lt!21330 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21330 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21330)))))

(assert (=> b!13655 (= lt!21330 ((_ sign_extend 32) (size!328 (buf!679 thiss!957))))))

(assert (= (and d!4418 res!12954) b!13654))

(assert (= (and b!13654 res!12953) b!13655))

(assert (=> d!4418 m!20185))

(assert (=> d!4418 m!20187))

(assert (=> b!13502 d!4418))

(assert (=> b!13508 d!4404))

(assert (=> b!13508 d!4418))

(declare-fun d!4420 () Bool)

(declare-fun e!8380 () Bool)

(assert (=> d!4420 e!8380))

(declare-fun res!12956 () Bool)

(assert (=> d!4420 (=> (not res!12956) (not e!8380))))

(declare-fun lt!21339 () (_ BitVec 64))

(declare-fun lt!21338 () (_ BitVec 64))

(declare-fun lt!21340 () (_ BitVec 64))

(assert (=> d!4420 (= res!12956 (= lt!21339 (bvsub lt!21340 lt!21338)))))

(assert (=> d!4420 (or (= (bvand lt!21340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21338 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21340 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21340 lt!21338) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4420 (= lt!21338 (remainingBits!0 ((_ sign_extend 32) (size!328 (buf!679 (_1!855 lt!21187)))) ((_ sign_extend 32) (currentByte!1787 (_1!855 lt!21187))) ((_ sign_extend 32) (currentBit!1782 (_1!855 lt!21187)))))))

(declare-fun lt!21341 () (_ BitVec 64))

(declare-fun lt!21337 () (_ BitVec 64))

(assert (=> d!4420 (= lt!21340 (bvmul lt!21341 lt!21337))))

(assert (=> d!4420 (or (= lt!21341 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21337 (bvsdiv (bvmul lt!21341 lt!21337) lt!21341)))))

(assert (=> d!4420 (= lt!21337 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4420 (= lt!21341 ((_ sign_extend 32) (size!328 (buf!679 (_1!855 lt!21187)))))))

(assert (=> d!4420 (= lt!21339 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1787 (_1!855 lt!21187))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1782 (_1!855 lt!21187)))))))

(assert (=> d!4420 (invariant!0 (currentBit!1782 (_1!855 lt!21187)) (currentByte!1787 (_1!855 lt!21187)) (size!328 (buf!679 (_1!855 lt!21187))))))

(assert (=> d!4420 (= (bitIndex!0 (size!328 (buf!679 (_1!855 lt!21187))) (currentByte!1787 (_1!855 lt!21187)) (currentBit!1782 (_1!855 lt!21187))) lt!21339)))

(declare-fun b!13656 () Bool)

(declare-fun res!12955 () Bool)

(assert (=> b!13656 (=> (not res!12955) (not e!8380))))

(assert (=> b!13656 (= res!12955 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21339))))

(declare-fun b!13657 () Bool)

(declare-fun lt!21336 () (_ BitVec 64))

(assert (=> b!13657 (= e!8380 (bvsle lt!21339 (bvmul lt!21336 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13657 (or (= lt!21336 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21336 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21336)))))

(assert (=> b!13657 (= lt!21336 ((_ sign_extend 32) (size!328 (buf!679 (_1!855 lt!21187)))))))

(assert (= (and d!4420 res!12956) b!13656))

(assert (= (and b!13656 res!12955) b!13657))

(declare-fun m!20255 () Bool)

(assert (=> d!4420 m!20255))

(declare-fun m!20257 () Bool)

(assert (=> d!4420 m!20257))

(assert (=> b!13503 d!4420))

(declare-fun d!4424 () Bool)

(assert (=> d!4424 (= (invariant!0 (currentBit!1782 (_2!854 lt!21185)) (currentByte!1787 (_2!854 lt!21185)) (size!328 (buf!679 (_2!854 lt!21185)))) (and (bvsge (currentBit!1782 (_2!854 lt!21185)) #b00000000000000000000000000000000) (bvslt (currentBit!1782 (_2!854 lt!21185)) #b00000000000000000000000000001000) (bvsge (currentByte!1787 (_2!854 lt!21185)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1787 (_2!854 lt!21185)) (size!328 (buf!679 (_2!854 lt!21185)))) (and (= (currentBit!1782 (_2!854 lt!21185)) #b00000000000000000000000000000000) (= (currentByte!1787 (_2!854 lt!21185)) (size!328 (buf!679 (_2!854 lt!21185))))))))))

(assert (=> b!13509 d!4424))

(declare-fun d!4426 () Bool)

(assert (=> d!4426 (= (array_inv!317 (buf!679 thiss!957)) (bvsge (size!328 (buf!679 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13504 d!4426))

(push 1)

(assert (not b!13595))

(assert (not b!13633))

(assert (not b!13631))

(assert (not d!4368))

(assert (not d!4404))

(assert (not b!13594))

(assert (not d!4392))

(assert (not b!13620))

(assert (not b!13592))

(assert (not b!13593))

(assert (not d!4420))

(assert (not d!4418))

(assert (not d!4372))

(assert (not d!4374))

(assert (not d!4390))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

