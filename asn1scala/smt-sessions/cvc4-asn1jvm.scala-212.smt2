; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4238 () Bool)

(assert start!4238)

(declare-fun res!15476 () Bool)

(declare-fun e!11276 () Bool)

(assert (=> start!4238 (=> (not res!15476) (not e!11276))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4238 (= res!15476 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4238 e!11276))

(assert (=> start!4238 true))

(declare-datatypes ((array!1164 0))(
  ( (array!1165 (arr!924 (Array (_ BitVec 32) (_ BitVec 8))) (size!495 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!860 0))(
  ( (BitStream!861 (buf!813 array!1164) (currentByte!2016 (_ BitVec 32)) (currentBit!2011 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!860)

(declare-fun e!11277 () Bool)

(declare-fun inv!12 (BitStream!860) Bool)

(assert (=> start!4238 (and (inv!12 thiss!1917) e!11277)))

(declare-fun b!17541 () Bool)

(declare-fun res!15475 () Bool)

(assert (=> b!17541 (=> (not res!15475) (not e!11276))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17541 (= res!15475 (validate_offset_bits!1 ((_ sign_extend 32) (size!495 (buf!813 thiss!1917))) ((_ sign_extend 32) (currentByte!2016 thiss!1917)) ((_ sign_extend 32) (currentBit!2011 thiss!1917)) nBits!604))))

(declare-fun b!17542 () Bool)

(declare-datatypes ((tuple2!2052 0))(
  ( (tuple2!2053 (_1!1087 array!1164) (_2!1087 BitStream!860)) )
))
(declare-fun lt!25285 () tuple2!2052)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17542 (= e!11276 (not (invariant!0 (currentBit!2011 (_2!1087 lt!25285)) (currentByte!2016 (_2!1087 lt!25285)) (size!495 (buf!813 (_2!1087 lt!25285))))))))

(declare-fun readBits!0 (BitStream!860 (_ BitVec 64)) tuple2!2052)

(assert (=> b!17542 (= lt!25285 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!17543 () Bool)

(declare-fun array_inv!465 (array!1164) Bool)

(assert (=> b!17543 (= e!11277 (array_inv!465 (buf!813 thiss!1917)))))

(assert (= (and start!4238 res!15476) b!17541))

(assert (= (and b!17541 res!15475) b!17542))

(assert (= start!4238 b!17543))

(declare-fun m!23859 () Bool)

(assert (=> start!4238 m!23859))

(declare-fun m!23861 () Bool)

(assert (=> b!17541 m!23861))

(declare-fun m!23863 () Bool)

(assert (=> b!17542 m!23863))

(declare-fun m!23865 () Bool)

(assert (=> b!17542 m!23865))

(declare-fun m!23867 () Bool)

(assert (=> b!17543 m!23867))

(push 1)

(assert (not b!17542))

(assert (not b!17541))

(assert (not b!17543))

(assert (not start!4238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5766 () Bool)

(assert (=> d!5766 (= (invariant!0 (currentBit!2011 (_2!1087 lt!25285)) (currentByte!2016 (_2!1087 lt!25285)) (size!495 (buf!813 (_2!1087 lt!25285)))) (and (bvsge (currentBit!2011 (_2!1087 lt!25285)) #b00000000000000000000000000000000) (bvslt (currentBit!2011 (_2!1087 lt!25285)) #b00000000000000000000000000001000) (bvsge (currentByte!2016 (_2!1087 lt!25285)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2016 (_2!1087 lt!25285)) (size!495 (buf!813 (_2!1087 lt!25285)))) (and (= (currentBit!2011 (_2!1087 lt!25285)) #b00000000000000000000000000000000) (= (currentByte!2016 (_2!1087 lt!25285)) (size!495 (buf!813 (_2!1087 lt!25285))))))))))

(assert (=> b!17542 d!5766))

(declare-fun e!11285 () Bool)

(declare-fun b!17579 () Bool)

(declare-fun lt!25356 () tuple2!2052)

(declare-datatypes ((List!190 0))(
  ( (Nil!187) (Cons!186 (h!305 Bool) (t!940 List!190)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!860 array!1164 (_ BitVec 64) (_ BitVec 64)) List!190)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!860 BitStream!860 (_ BitVec 64)) List!190)

(assert (=> b!17579 (= e!11285 (= (byteArrayBitContentToList!0 (_2!1087 lt!25356) (_1!1087 lt!25356) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1087 lt!25356) thiss!1917 nBits!604)))))

(declare-fun b!17580 () Bool)

(declare-fun res!15516 () Bool)

(assert (=> b!17580 (=> (not res!15516) (not e!11285))))

(declare-fun lt!25349 () (_ BitVec 64))

(assert (=> b!17580 (= res!15516 (= (size!495 (_1!1087 lt!25356)) ((_ extract 31 0) lt!25349)))))

(assert (=> b!17580 (and (bvslt lt!25349 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!25349 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!25355 () (_ BitVec 64))

(declare-fun lt!25351 () (_ BitVec 64))

(assert (=> b!17580 (= lt!25349 (bvsdiv lt!25355 lt!25351))))

(assert (=> b!17580 (and (not (= lt!25351 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!25355 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!25351 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!17580 (= lt!25351 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!25353 () (_ BitVec 64))

(declare-fun lt!25350 () (_ BitVec 64))

(assert (=> b!17580 (= lt!25355 (bvsub lt!25353 lt!25350))))

(assert (=> b!17580 (or (= (bvand lt!25353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25350 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!25353 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!25353 lt!25350) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17580 (= lt!25350 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!25357 () (_ BitVec 64))

(assert (=> b!17580 (= lt!25353 (bvadd nBits!604 lt!25357))))

(assert (=> b!17580 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25357 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!25357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17580 (= lt!25357 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!5772 () Bool)

(assert (=> d!5772 e!11285))

(declare-fun res!15514 () Bool)

(assert (=> d!5772 (=> (not res!15514) (not e!11285))))

(assert (=> d!5772 (= res!15514 (= (buf!813 (_2!1087 lt!25356)) (buf!813 thiss!1917)))))

(declare-datatypes ((Unit!1576 0))(
  ( (Unit!1577) )
))
(declare-datatypes ((tuple3!114 0))(
  ( (tuple3!115 (_1!1090 Unit!1576) (_2!1090 BitStream!860) (_3!63 array!1164)) )
))
(declare-fun lt!25352 () tuple3!114)

(assert (=> d!5772 (= lt!25356 (tuple2!2053 (_3!63 lt!25352) (_2!1090 lt!25352)))))

(declare-fun readBitsLoop!0 (BitStream!860 (_ BitVec 64) array!1164 (_ BitVec 64) (_ BitVec 64)) tuple3!114)

(assert (=> d!5772 (= lt!25352 (readBitsLoop!0 thiss!1917 nBits!604 (array!1165 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5772 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5772 (= (readBits!0 thiss!1917 nBits!604) lt!25356)))

(declare-fun b!17581 () Bool)

(declare-fun res!15512 () Bool)

(assert (=> b!17581 (=> (not res!15512) (not e!11285))))

(assert (=> b!17581 (= res!15512 (invariant!0 (currentBit!2011 (_2!1087 lt!25356)) (currentByte!2016 (_2!1087 lt!25356)) (size!495 (buf!813 (_2!1087 lt!25356)))))))

(declare-fun b!17582 () Bool)

(declare-fun res!15513 () Bool)

(assert (=> b!17582 (=> (not res!15513) (not e!11285))))

(assert (=> b!17582 (= res!15513 (bvsle (currentByte!2016 thiss!1917) (currentByte!2016 (_2!1087 lt!25356))))))

(declare-fun b!17583 () Bool)

(declare-fun res!15515 () Bool)

(assert (=> b!17583 (=> (not res!15515) (not e!11285))))

(declare-fun lt!25354 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!17583 (= res!15515 (= (bvadd lt!25354 nBits!604) (bitIndex!0 (size!495 (buf!813 (_2!1087 lt!25356))) (currentByte!2016 (_2!1087 lt!25356)) (currentBit!2011 (_2!1087 lt!25356)))))))

(assert (=> b!17583 (or (not (= (bvand lt!25354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!25354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!25354 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17583 (= lt!25354 (bitIndex!0 (size!495 (buf!813 thiss!1917)) (currentByte!2016 thiss!1917) (currentBit!2011 thiss!1917)))))

(assert (= (and d!5772 res!15514) b!17583))

(assert (= (and b!17583 res!15515) b!17581))

(assert (= (and b!17581 res!15512) b!17580))

(assert (= (and b!17580 res!15516) b!17582))

(assert (= (and b!17582 res!15513) b!17579))

(declare-fun m!23889 () Bool)

(assert (=> b!17579 m!23889))

(declare-fun m!23891 () Bool)

(assert (=> b!17579 m!23891))

(declare-fun m!23893 () Bool)

(assert (=> d!5772 m!23893))

(declare-fun m!23895 () Bool)

(assert (=> b!17581 m!23895))

(declare-fun m!23897 () Bool)

(assert (=> b!17583 m!23897))

(declare-fun m!23899 () Bool)

(assert (=> b!17583 m!23899))

(assert (=> b!17542 d!5772))

(declare-fun d!5782 () Bool)

