; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3038 () Bool)

(assert start!3038)

(declare-fun b!13882 () Bool)

(declare-fun e!8530 () Bool)

(declare-fun e!8529 () Bool)

(assert (=> b!13882 (= e!8530 (not e!8529))))

(declare-fun res!13171 () Bool)

(assert (=> b!13882 (=> res!13171 e!8529)))

(declare-datatypes ((array!777 0))(
  ( (array!778 (arr!763 (Array (_ BitVec 32) (_ BitVec 8))) (size!334 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!628 0))(
  ( (BitStream!629 (buf!685 array!777) (currentByte!1811 (_ BitVec 32)) (currentBit!1806 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1133 0))(
  ( (Unit!1134) )
))
(declare-datatypes ((tuple2!1634 0))(
  ( (tuple2!1635 (_1!872 Unit!1133) (_2!872 BitStream!628)) )
))
(declare-fun lt!21532 () tuple2!1634)

(declare-fun thiss!957 () BitStream!628)

(assert (=> b!13882 (= res!13171 (not (= (size!334 (buf!685 (_2!872 lt!21532))) (size!334 (buf!685 thiss!957)))))))

(declare-fun e!8527 () Bool)

(assert (=> b!13882 e!8527))

(declare-fun res!13175 () Bool)

(assert (=> b!13882 (=> (not res!13175) (not e!8527))))

(assert (=> b!13882 (= res!13175 (= (size!334 (buf!685 thiss!957)) (size!334 (buf!685 (_2!872 lt!21532)))))))

(declare-fun appendBit!0 (BitStream!628 Bool) tuple2!1634)

(assert (=> b!13882 (= lt!21532 (appendBit!0 thiss!957 false))))

(declare-fun b!13883 () Bool)

(declare-fun lt!21530 () BitStream!628)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!13883 (= e!8529 (validate_offset_bit!0 ((_ sign_extend 32) (size!334 (buf!685 lt!21530))) ((_ sign_extend 32) (currentByte!1811 lt!21530)) ((_ sign_extend 32) (currentBit!1806 lt!21530))))))

(declare-fun readerFrom!0 (BitStream!628 (_ BitVec 32) (_ BitVec 32)) BitStream!628)

(assert (=> b!13883 (= lt!21530 (readerFrom!0 (_2!872 lt!21532) (currentBit!1806 thiss!957) (currentByte!1811 thiss!957)))))

(declare-fun b!13884 () Bool)

(declare-fun res!13176 () Bool)

(assert (=> b!13884 (=> res!13176 e!8529)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!13884 (= res!13176 (not (= (bitIndex!0 (size!334 (buf!685 (_2!872 lt!21532))) (currentByte!1811 (_2!872 lt!21532)) (currentBit!1806 (_2!872 lt!21532))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!334 (buf!685 thiss!957)) (currentByte!1811 thiss!957) (currentBit!1806 thiss!957))))))))

(declare-fun res!13172 () Bool)

(assert (=> start!3038 (=> (not res!13172) (not e!8530))))

(assert (=> start!3038 (= res!13172 (validate_offset_bit!0 ((_ sign_extend 32) (size!334 (buf!685 thiss!957))) ((_ sign_extend 32) (currentByte!1811 thiss!957)) ((_ sign_extend 32) (currentBit!1806 thiss!957))))))

(assert (=> start!3038 e!8530))

(declare-fun e!8525 () Bool)

(declare-fun inv!12 (BitStream!628) Bool)

(assert (=> start!3038 (and (inv!12 thiss!957) e!8525)))

(declare-fun b!13885 () Bool)

(declare-fun e!8531 () Bool)

(assert (=> b!13885 (= e!8527 e!8531)))

(declare-fun res!13173 () Bool)

(assert (=> b!13885 (=> (not res!13173) (not e!8531))))

(declare-fun lt!21531 () (_ BitVec 64))

(declare-fun lt!21533 () (_ BitVec 64))

(assert (=> b!13885 (= res!13173 (= lt!21531 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!21533)))))

(assert (=> b!13885 (= lt!21531 (bitIndex!0 (size!334 (buf!685 (_2!872 lt!21532))) (currentByte!1811 (_2!872 lt!21532)) (currentBit!1806 (_2!872 lt!21532))))))

(assert (=> b!13885 (= lt!21533 (bitIndex!0 (size!334 (buf!685 thiss!957)) (currentByte!1811 thiss!957) (currentBit!1806 thiss!957)))))

(declare-fun b!13886 () Bool)

(declare-fun res!13177 () Bool)

(assert (=> b!13886 (=> res!13177 e!8529)))

(declare-fun isPrefixOf!0 (BitStream!628 BitStream!628) Bool)

(assert (=> b!13886 (= res!13177 (not (isPrefixOf!0 thiss!957 (_2!872 lt!21532))))))

(declare-fun b!13887 () Bool)

(declare-fun e!8528 () Bool)

(declare-datatypes ((tuple2!1636 0))(
  ( (tuple2!1637 (_1!873 BitStream!628) (_2!873 Bool)) )
))
(declare-fun lt!21529 () tuple2!1636)

(assert (=> b!13887 (= e!8528 (= (bitIndex!0 (size!334 (buf!685 (_1!873 lt!21529))) (currentByte!1811 (_1!873 lt!21529)) (currentBit!1806 (_1!873 lt!21529))) lt!21531))))

(declare-fun b!13888 () Bool)

(declare-fun res!13170 () Bool)

(assert (=> b!13888 (=> (not res!13170) (not e!8531))))

(assert (=> b!13888 (= res!13170 (isPrefixOf!0 thiss!957 (_2!872 lt!21532)))))

(declare-fun b!13889 () Bool)

(declare-fun array_inv!323 (array!777) Bool)

(assert (=> b!13889 (= e!8525 (array_inv!323 (buf!685 thiss!957)))))

(declare-fun b!13890 () Bool)

(assert (=> b!13890 (= e!8531 e!8528)))

(declare-fun res!13174 () Bool)

(assert (=> b!13890 (=> (not res!13174) (not e!8528))))

(assert (=> b!13890 (= res!13174 (and (not (_2!873 lt!21529)) (= (_1!873 lt!21529) (_2!872 lt!21532))))))

(declare-fun readBitPure!0 (BitStream!628) tuple2!1636)

(assert (=> b!13890 (= lt!21529 (readBitPure!0 (readerFrom!0 (_2!872 lt!21532) (currentBit!1806 thiss!957) (currentByte!1811 thiss!957))))))

(assert (= (and start!3038 res!13172) b!13882))

(assert (= (and b!13882 res!13175) b!13885))

(assert (= (and b!13885 res!13173) b!13888))

(assert (= (and b!13888 res!13170) b!13890))

(assert (= (and b!13890 res!13174) b!13887))

(assert (= (and b!13882 (not res!13171)) b!13884))

(assert (= (and b!13884 (not res!13176)) b!13886))

(assert (= (and b!13886 (not res!13177)) b!13883))

(assert (= start!3038 b!13889))

(declare-fun m!20415 () Bool)

(assert (=> b!13883 m!20415))

(declare-fun m!20417 () Bool)

(assert (=> b!13883 m!20417))

(declare-fun m!20419 () Bool)

(assert (=> start!3038 m!20419))

(declare-fun m!20421 () Bool)

(assert (=> start!3038 m!20421))

(declare-fun m!20423 () Bool)

(assert (=> b!13889 m!20423))

(declare-fun m!20425 () Bool)

(assert (=> b!13886 m!20425))

(declare-fun m!20427 () Bool)

(assert (=> b!13882 m!20427))

(declare-fun m!20429 () Bool)

(assert (=> b!13885 m!20429))

(declare-fun m!20431 () Bool)

(assert (=> b!13885 m!20431))

(assert (=> b!13884 m!20429))

(assert (=> b!13884 m!20431))

(assert (=> b!13890 m!20417))

(assert (=> b!13890 m!20417))

(declare-fun m!20433 () Bool)

(assert (=> b!13890 m!20433))

(declare-fun m!20435 () Bool)

(assert (=> b!13887 m!20435))

(assert (=> b!13888 m!20425))

(push 1)

(assert (not b!13887))

(assert (not b!13886))

(assert (not start!3038))

(assert (not b!13890))

(assert (not b!13889))

(assert (not b!13888))

(assert (not b!13885))

(assert (not b!13882))

(assert (not b!13884))

(assert (not b!13883))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!4510 () Bool)

(declare-datatypes ((tuple2!1646 0))(
  ( (tuple2!1647 (_1!878 Bool) (_2!878 BitStream!628)) )
))
(declare-fun lt!21566 () tuple2!1646)

(declare-fun readBit!0 (BitStream!628) tuple2!1646)

(assert (=> d!4510 (= lt!21566 (readBit!0 (readerFrom!0 (_2!872 lt!21532) (currentBit!1806 thiss!957) (currentByte!1811 thiss!957))))))

(assert (=> d!4510 (= (readBitPure!0 (readerFrom!0 (_2!872 lt!21532) (currentBit!1806 thiss!957) (currentByte!1811 thiss!957))) (tuple2!1637 (_2!878 lt!21566) (_1!878 lt!21566)))))

(declare-fun bs!1241 () Bool)

(assert (= bs!1241 d!4510))

(assert (=> bs!1241 m!20417))

(declare-fun m!20489 () Bool)

(assert (=> bs!1241 m!20489))

(assert (=> b!13890 d!4510))

(declare-fun d!4516 () Bool)

(declare-fun e!8585 () Bool)

(assert (=> d!4516 e!8585))

(declare-fun res!13242 () Bool)

(assert (=> d!4516 (=> (not res!13242) (not e!8585))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!4516 (= res!13242 (invariant!0 (currentBit!1806 (_2!872 lt!21532)) (currentByte!1811 (_2!872 lt!21532)) (size!334 (buf!685 (_2!872 lt!21532)))))))

(assert (=> d!4516 (= (readerFrom!0 (_2!872 lt!21532) (currentBit!1806 thiss!957) (currentByte!1811 thiss!957)) (BitStream!629 (buf!685 (_2!872 lt!21532)) (currentByte!1811 thiss!957) (currentBit!1806 thiss!957)))))

(declare-fun b!13959 () Bool)

(assert (=> b!13959 (= e!8585 (invariant!0 (currentBit!1806 thiss!957) (currentByte!1811 thiss!957) (size!334 (buf!685 (_2!872 lt!21532)))))))

(assert (= (and d!4516 res!13242) b!13959))

(declare-fun m!20491 () Bool)

(assert (=> d!4516 m!20491))

(declare-fun m!20493 () Bool)

(assert (=> b!13959 m!20493))

(assert (=> b!13890 d!4516))

(declare-fun d!4518 () Bool)

(declare-fun e!8593 () Bool)

(assert (=> d!4518 e!8593))

(declare-fun res!13258 () Bool)

(assert (=> d!4518 (=> (not res!13258) (not e!8593))))

(declare-fun lt!21617 () (_ BitVec 64))

(declare-fun lt!21614 () (_ BitVec 64))

(declare-fun lt!21616 () (_ BitVec 64))

(assert (=> d!4518 (= res!13258 (= lt!21614 (bvsub lt!21617 lt!21616)))))

(assert (=> d!4518 (or (= (bvand lt!21617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21616 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21617 lt!21616) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!4518 (= lt!21616 (remainingBits!0 ((_ sign_extend 32) (size!334 (buf!685 (_2!872 lt!21532)))) ((_ sign_extend 32) (currentByte!1811 (_2!872 lt!21532))) ((_ sign_extend 32) (currentBit!1806 (_2!872 lt!21532)))))))

(declare-fun lt!21612 () (_ BitVec 64))

(declare-fun lt!21615 () (_ BitVec 64))

(assert (=> d!4518 (= lt!21617 (bvmul lt!21612 lt!21615))))

(assert (=> d!4518 (or (= lt!21612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21615 (bvsdiv (bvmul lt!21612 lt!21615) lt!21612)))))

(assert (=> d!4518 (= lt!21615 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4518 (= lt!21612 ((_ sign_extend 32) (size!334 (buf!685 (_2!872 lt!21532)))))))

(assert (=> d!4518 (= lt!21614 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1811 (_2!872 lt!21532))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1806 (_2!872 lt!21532)))))))

(assert (=> d!4518 (invariant!0 (currentBit!1806 (_2!872 lt!21532)) (currentByte!1811 (_2!872 lt!21532)) (size!334 (buf!685 (_2!872 lt!21532))))))

(assert (=> d!4518 (= (bitIndex!0 (size!334 (buf!685 (_2!872 lt!21532))) (currentByte!1811 (_2!872 lt!21532)) (currentBit!1806 (_2!872 lt!21532))) lt!21614)))

(declare-fun b!13974 () Bool)

(declare-fun res!13257 () Bool)

(assert (=> b!13974 (=> (not res!13257) (not e!8593))))

(assert (=> b!13974 (= res!13257 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21614))))

(declare-fun b!13975 () Bool)

(declare-fun lt!21613 () (_ BitVec 64))

(assert (=> b!13975 (= e!8593 (bvsle lt!21614 (bvmul lt!21613 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13975 (or (= lt!21613 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21613 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21613)))))

(assert (=> b!13975 (= lt!21613 ((_ sign_extend 32) (size!334 (buf!685 (_2!872 lt!21532)))))))

(assert (= (and d!4518 res!13258) b!13974))

(assert (= (and b!13974 res!13257) b!13975))

(declare-fun m!20507 () Bool)

(assert (=> d!4518 m!20507))

(assert (=> d!4518 m!20491))

(assert (=> b!13885 d!4518))

(declare-fun d!4536 () Bool)

(declare-fun e!8594 () Bool)

(assert (=> d!4536 e!8594))

(declare-fun res!13260 () Bool)

(assert (=> d!4536 (=> (not res!13260) (not e!8594))))

(declare-fun lt!21622 () (_ BitVec 64))

(declare-fun lt!21620 () (_ BitVec 64))

(declare-fun lt!21623 () (_ BitVec 64))

(assert (=> d!4536 (= res!13260 (= lt!21620 (bvsub lt!21623 lt!21622)))))

(assert (=> d!4536 (or (= (bvand lt!21623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21622 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21623 lt!21622) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4536 (= lt!21622 (remainingBits!0 ((_ sign_extend 32) (size!334 (buf!685 thiss!957))) ((_ sign_extend 32) (currentByte!1811 thiss!957)) ((_ sign_extend 32) (currentBit!1806 thiss!957))))))

(declare-fun lt!21618 () (_ BitVec 64))

(declare-fun lt!21621 () (_ BitVec 64))

(assert (=> d!4536 (= lt!21623 (bvmul lt!21618 lt!21621))))

(assert (=> d!4536 (or (= lt!21618 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21621 (bvsdiv (bvmul lt!21618 lt!21621) lt!21618)))))

(assert (=> d!4536 (= lt!21621 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4536 (= lt!21618 ((_ sign_extend 32) (size!334 (buf!685 thiss!957))))))

(assert (=> d!4536 (= lt!21620 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1811 thiss!957)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1806 thiss!957))))))

(assert (=> d!4536 (invariant!0 (currentBit!1806 thiss!957) (currentByte!1811 thiss!957) (size!334 (buf!685 thiss!957)))))

(assert (=> d!4536 (= (bitIndex!0 (size!334 (buf!685 thiss!957)) (currentByte!1811 thiss!957) (currentBit!1806 thiss!957)) lt!21620)))

(declare-fun b!13976 () Bool)

(declare-fun res!13259 () Bool)

(assert (=> b!13976 (=> (not res!13259) (not e!8594))))

(assert (=> b!13976 (= res!13259 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21620))))

(declare-fun b!13977 () Bool)

(declare-fun lt!21619 () (_ BitVec 64))

(assert (=> b!13977 (= e!8594 (bvsle lt!21620 (bvmul lt!21619 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!13977 (or (= lt!21619 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21619 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21619)))))

(assert (=> b!13977 (= lt!21619 ((_ sign_extend 32) (size!334 (buf!685 thiss!957))))))

(assert (= (and d!4536 res!13260) b!13976))

(assert (= (and b!13976 res!13259) b!13977))

(declare-fun m!20509 () Bool)

(assert (=> d!4536 m!20509))

(declare-fun m!20511 () Bool)

(assert (=> d!4536 m!20511))

(assert (=> b!13885 d!4536))

(declare-fun d!4538 () Bool)

(assert (=> d!4538 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!334 (buf!685 lt!21530))) ((_ sign_extend 32) (currentByte!1811 lt!21530)) ((_ sign_extend 32) (currentBit!1806 lt!21530))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!334 (buf!685 lt!21530))) ((_ sign_extend 32) (currentByte!1811 lt!21530)) ((_ sign_extend 32) (currentBit!1806 lt!21530))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1245 () Bool)

(assert (= bs!1245 d!4538))

(declare-fun m!20513 () Bool)

(assert (=> bs!1245 m!20513))

(assert (=> b!13883 d!4538))

(assert (=> b!13883 d!4516))

(declare-fun d!4540 () Bool)

(assert (=> d!4540 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!334 (buf!685 thiss!957))) ((_ sign_extend 32) (currentByte!1811 thiss!957)) ((_ sign_extend 32) (currentBit!1806 thiss!957))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!334 (buf!685 thiss!957))) ((_ sign_extend 32) (currentByte!1811 thiss!957)) ((_ sign_extend 32) (currentBit!1806 thiss!957))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1246 () Bool)

(assert (= bs!1246 d!4540))

(assert (=> bs!1246 m!20509))

(assert (=> start!3038 d!4540))

(declare-fun d!4542 () Bool)

(assert (=> d!4542 (= (inv!12 thiss!957) (invariant!0 (currentBit!1806 thiss!957) (currentByte!1811 thiss!957) (size!334 (buf!685 thiss!957))))))

(declare-fun bs!1247 () Bool)

(assert (= bs!1247 d!4542))

(assert (=> bs!1247 m!20511))

(assert (=> start!3038 d!4542))

(assert (=> b!13884 d!4518))

(assert (=> b!13884 d!4536))

(declare-fun d!4544 () Bool)

(assert (=> d!4544 (= (array_inv!323 (buf!685 thiss!957)) (bvsge (size!334 (buf!685 thiss!957)) #b00000000000000000000000000000000))))

(assert (=> b!13889 d!4544))

(declare-fun d!4548 () Bool)

(declare-fun e!8616 () Bool)

(assert (=> d!4548 e!8616))

(declare-fun res!13301 () Bool)

(assert (=> d!4548 (=> (not res!13301) (not e!8616))))

(declare-fun lt!21677 () tuple2!1634)

(assert (=> d!4548 (= res!13301 (= (size!334 (buf!685 thiss!957)) (size!334 (buf!685 (_2!872 lt!21677)))))))

(declare-fun choose!16 (BitStream!628 Bool) tuple2!1634)

(assert (=> d!4548 (= lt!21677 (choose!16 thiss!957 false))))

(assert (=> d!4548 (validate_offset_bit!0 ((_ sign_extend 32) (size!334 (buf!685 thiss!957))) ((_ sign_extend 32) (currentByte!1811 thiss!957)) ((_ sign_extend 32) (currentBit!1806 thiss!957)))))

(assert (=> d!4548 (= (appendBit!0 thiss!957 false) lt!21677)))

(declare-fun b!14021 () Bool)

(declare-fun e!8617 () Bool)

(assert (=> b!14021 (= e!8616 e!8617)))

(declare-fun res!13303 () Bool)

(assert (=> b!14021 (=> (not res!13303) (not e!8617))))

(declare-fun lt!21674 () tuple2!1636)

(assert (=> b!14021 (= res!13303 (and (= (_2!873 lt!21674) false) (= (_1!873 lt!21674) (_2!872 lt!21677))))))

(assert (=> b!14021 (= lt!21674 (readBitPure!0 (readerFrom!0 (_2!872 lt!21677) (currentBit!1806 thiss!957) (currentByte!1811 thiss!957))))))

(declare-fun b!14019 () Bool)

(declare-fun res!13300 () Bool)

(assert (=> b!14019 (=> (not res!13300) (not e!8616))))

(declare-fun lt!21676 () (_ BitVec 64))

(declare-fun lt!21675 () (_ BitVec 64))

(assert (=> b!14019 (= res!13300 (= (bitIndex!0 (size!334 (buf!685 (_2!872 lt!21677))) (currentByte!1811 (_2!872 lt!21677)) (currentBit!1806 (_2!872 lt!21677))) (bvadd lt!21676 lt!21675)))))

(assert (=> b!14019 (or (not (= (bvand lt!21676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21675 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!21676 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!21676 lt!21675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!14019 (= lt!21675 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!14019 (= lt!21676 (bitIndex!0 (size!334 (buf!685 thiss!957)) (currentByte!1811 thiss!957) (currentBit!1806 thiss!957)))))

(declare-fun b!14022 () Bool)

(assert (=> b!14022 (= e!8617 (= (bitIndex!0 (size!334 (buf!685 (_1!873 lt!21674))) (currentByte!1811 (_1!873 lt!21674)) (currentBit!1806 (_1!873 lt!21674))) (bitIndex!0 (size!334 (buf!685 (_2!872 lt!21677))) (currentByte!1811 (_2!872 lt!21677)) (currentBit!1806 (_2!872 lt!21677)))))))

(declare-fun b!14020 () Bool)

(declare-fun res!13302 () Bool)

(assert (=> b!14020 (=> (not res!13302) (not e!8616))))

(assert (=> b!14020 (= res!13302 (isPrefixOf!0 thiss!957 (_2!872 lt!21677)))))

(assert (= (and d!4548 res!13301) b!14019))

(assert (= (and b!14019 res!13300) b!14020))

(assert (= (and b!14020 res!13302) b!14021))

(assert (= (and b!14021 res!13303) b!14022))

(declare-fun m!20541 () Bool)

(assert (=> d!4548 m!20541))

(assert (=> d!4548 m!20419))

(declare-fun m!20543 () Bool)

(assert (=> b!14022 m!20543))

(declare-fun m!20545 () Bool)

(assert (=> b!14022 m!20545))

(declare-fun m!20547 () Bool)

(assert (=> b!14020 m!20547))

(assert (=> b!14019 m!20545))

(assert (=> b!14019 m!20431))

(declare-fun m!20549 () Bool)

(assert (=> b!14021 m!20549))

(assert (=> b!14021 m!20549))

(declare-fun m!20551 () Bool)

(assert (=> b!14021 m!20551))

(assert (=> b!13882 d!4548))

(declare-fun d!4562 () Bool)

(declare-fun e!8618 () Bool)

(assert (=> d!4562 e!8618))

(declare-fun res!13305 () Bool)

(assert (=> d!4562 (=> (not res!13305) (not e!8618))))

(declare-fun lt!21683 () (_ BitVec 64))

(declare-fun lt!21680 () (_ BitVec 64))

(declare-fun lt!21682 () (_ BitVec 64))

(assert (=> d!4562 (= res!13305 (= lt!21680 (bvsub lt!21683 lt!21682)))))

(assert (=> d!4562 (or (= (bvand lt!21683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!21682 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!21683 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!21683 lt!21682) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!4562 (= lt!21682 (remainingBits!0 ((_ sign_extend 32) (size!334 (buf!685 (_1!873 lt!21529)))) ((_ sign_extend 32) (currentByte!1811 (_1!873 lt!21529))) ((_ sign_extend 32) (currentBit!1806 (_1!873 lt!21529)))))))

(declare-fun lt!21678 () (_ BitVec 64))

(declare-fun lt!21681 () (_ BitVec 64))

(assert (=> d!4562 (= lt!21683 (bvmul lt!21678 lt!21681))))

(assert (=> d!4562 (or (= lt!21678 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!21681 (bvsdiv (bvmul lt!21678 lt!21681) lt!21678)))))

(assert (=> d!4562 (= lt!21681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!4562 (= lt!21678 ((_ sign_extend 32) (size!334 (buf!685 (_1!873 lt!21529)))))))

(assert (=> d!4562 (= lt!21680 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1811 (_1!873 lt!21529))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1806 (_1!873 lt!21529)))))))

(assert (=> d!4562 (invariant!0 (currentBit!1806 (_1!873 lt!21529)) (currentByte!1811 (_1!873 lt!21529)) (size!334 (buf!685 (_1!873 lt!21529))))))

(assert (=> d!4562 (= (bitIndex!0 (size!334 (buf!685 (_1!873 lt!21529))) (currentByte!1811 (_1!873 lt!21529)) (currentBit!1806 (_1!873 lt!21529))) lt!21680)))

(declare-fun b!14023 () Bool)

(declare-fun res!13304 () Bool)

(assert (=> b!14023 (=> (not res!13304) (not e!8618))))

(assert (=> b!14023 (= res!13304 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!21680))))

(declare-fun b!14024 () Bool)

(declare-fun lt!21679 () (_ BitVec 64))

(assert (=> b!14024 (= e!8618 (bvsle lt!21680 (bvmul lt!21679 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!14024 (or (= lt!21679 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!21679 #b0000000000000000000000000000000000000000000000000000000000001000) lt!21679)))))

(assert (=> b!14024 (= lt!21679 ((_ sign_extend 32) (size!334 (buf!685 (_1!873 lt!21529)))))))

(assert (= (and d!4562 res!13305) b!14023))

(assert (= (and b!14023 res!13304) b!14024))

(declare-fun m!20553 () Bool)

(assert (=> d!4562 m!20553))

(declare-fun m!20555 () Bool)

(assert (=> d!4562 m!20555))

(assert (=> b!13887 d!4562))

(declare-fun d!4564 () Bool)

(declare-fun res!13321 () Bool)

(declare-fun e!8627 () Bool)

(assert (=> d!4564 (=> (not res!13321) (not e!8627))))

(assert (=> d!4564 (= res!13321 (= (size!334 (buf!685 thiss!957)) (size!334 (buf!685 (_2!872 lt!21532)))))))

(assert (=> d!4564 (= (isPrefixOf!0 thiss!957 (_2!872 lt!21532)) e!8627)))

(declare-fun b!14040 () Bool)

(declare-fun res!13320 () Bool)

(assert (=> b!14040 (=> (not res!13320) (not e!8627))))

(assert (=> b!14040 (= res!13320 (bvsle (bitIndex!0 (size!334 (buf!685 thiss!957)) (currentByte!1811 thiss!957) (currentBit!1806 thiss!957)) (bitIndex!0 (size!334 (buf!685 (_2!872 lt!21532))) (currentByte!1811 (_2!872 lt!21532)) (currentBit!1806 (_2!872 lt!21532)))))))

(declare-fun b!14041 () Bool)

(declare-fun e!8628 () Bool)

(assert (=> b!14041 (= e!8627 e!8628)))

(declare-fun res!13322 () Bool)

(assert (=> b!14041 (=> res!13322 e!8628)))

(assert (=> b!14041 (= res!13322 (= (size!334 (buf!685 thiss!957)) #b00000000000000000000000000000000))))

(declare-fun b!14042 () Bool)

(declare-fun arrayBitRangesEq!0 (array!777 array!777 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!14042 (= e!8628 (arrayBitRangesEq!0 (buf!685 thiss!957) (buf!685 (_2!872 lt!21532)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!334 (buf!685 thiss!957)) (currentByte!1811 thiss!957) (currentBit!1806 thiss!957))))))

(assert (= (and d!4564 res!13321) b!14040))

(assert (= (and b!14040 res!13320) b!14041))

(assert (= (and b!14041 (not res!13322)) b!14042))

(assert (=> b!14040 m!20431))

(assert (=> b!14040 m!20429))

(assert (=> b!14042 m!20431))

(assert (=> b!14042 m!20431))

(declare-fun m!20557 () Bool)

(assert (=> b!14042 m!20557))

(assert (=> b!13888 d!4564))

(assert (=> b!13886 d!4564))

(push 1)

(assert (not d!4562))

(assert (not d!4510))

(assert (not d!4548))

(assert (not b!14021))

(assert (not d!4540))

(assert (not b!14040))

(assert (not b!14022))

(assert (not d!4516))

(assert (not b!14042))

(assert (not d!4518))

(assert (not d!4542))

(assert (not b!14019))

(assert (not d!4538))

(assert (not b!13959))

(assert (not b!14020))

(assert (not d!4536))

(check-sat)

(pop 1)

(push 1)

(check-sat)

