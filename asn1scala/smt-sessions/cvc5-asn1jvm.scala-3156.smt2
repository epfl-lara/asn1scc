; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72470 () Bool)

(assert start!72470)

(declare-fun res!266049 () Bool)

(declare-fun e!233573 () Bool)

(assert (=> start!72470 (=> (not res!266049) (not e!233573))))

(declare-datatypes ((array!20767 0))(
  ( (array!20768 (arr!10126 (Array (_ BitVec 32) (_ BitVec 8))) (size!9034 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14230 0))(
  ( (BitStream!14231 (buf!8176 array!20767) (currentByte!15092 (_ BitVec 32)) (currentBit!15087 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14230)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72470 (= res!266049 (validate_offset_bit!0 ((_ sign_extend 32) (size!9034 (buf!8176 thiss!1702))) ((_ sign_extend 32) (currentByte!15092 thiss!1702)) ((_ sign_extend 32) (currentBit!15087 thiss!1702))))))

(assert (=> start!72470 e!233573))

(declare-fun e!233572 () Bool)

(declare-fun inv!12 (BitStream!14230) Bool)

(assert (=> start!72470 (and (inv!12 thiss!1702) e!233572)))

(declare-fun b!324131 () Bool)

(declare-fun res!266050 () Bool)

(assert (=> b!324131 (=> (not res!266050) (not e!233573))))

(declare-datatypes ((Unit!22068 0))(
  ( (Unit!22069) )
))
(declare-datatypes ((tuple2!23750 0))(
  ( (tuple2!23751 (_1!13504 Unit!22068) (_2!13504 BitStream!14230)) )
))
(declare-fun increaseBitIndex!0 (BitStream!14230) tuple2!23750)

(assert (=> b!324131 (= res!266050 (= (buf!8176 (_2!13504 (increaseBitIndex!0 thiss!1702))) (buf!8176 thiss!1702)))))

(declare-fun b!324132 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!324132 (= e!233573 (not (invariant!0 (currentBit!15087 thiss!1702) (currentByte!15092 thiss!1702) (size!9034 (buf!8176 thiss!1702)))))))

(declare-fun b!324133 () Bool)

(declare-fun array_inv!8586 (array!20767) Bool)

(assert (=> b!324133 (= e!233572 (array_inv!8586 (buf!8176 thiss!1702)))))

(assert (= (and start!72470 res!266049) b!324131))

(assert (= (and b!324131 res!266050) b!324132))

(assert (= start!72470 b!324133))

(declare-fun m!462215 () Bool)

(assert (=> start!72470 m!462215))

(declare-fun m!462217 () Bool)

(assert (=> start!72470 m!462217))

(declare-fun m!462219 () Bool)

(assert (=> b!324131 m!462219))

(declare-fun m!462221 () Bool)

(assert (=> b!324132 m!462221))

(declare-fun m!462223 () Bool)

(assert (=> b!324133 m!462223))

(push 1)

(assert (not start!72470))

(assert (not b!324132))

(assert (not b!324131))

(assert (not b!324133))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106422 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106422 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9034 (buf!8176 thiss!1702))) ((_ sign_extend 32) (currentByte!15092 thiss!1702)) ((_ sign_extend 32) (currentBit!15087 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9034 (buf!8176 thiss!1702))) ((_ sign_extend 32) (currentByte!15092 thiss!1702)) ((_ sign_extend 32) (currentBit!15087 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28031 () Bool)

(assert (= bs!28031 d!106422))

(declare-fun m!462247 () Bool)

(assert (=> bs!28031 m!462247))

(assert (=> start!72470 d!106422))

(declare-fun d!106428 () Bool)

(assert (=> d!106428 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15087 thiss!1702) (currentByte!15092 thiss!1702) (size!9034 (buf!8176 thiss!1702))))))

(declare-fun bs!28033 () Bool)

(assert (= bs!28033 d!106428))

(assert (=> bs!28033 m!462221))

(assert (=> start!72470 d!106428))

(declare-fun d!106432 () Bool)

(assert (=> d!106432 (= (invariant!0 (currentBit!15087 thiss!1702) (currentByte!15092 thiss!1702) (size!9034 (buf!8176 thiss!1702))) (and (bvsge (currentBit!15087 thiss!1702) #b00000000000000000000000000000000) (bvslt (currentBit!15087 thiss!1702) #b00000000000000000000000000001000) (bvsge (currentByte!15092 thiss!1702) #b00000000000000000000000000000000) (or (bvslt (currentByte!15092 thiss!1702) (size!9034 (buf!8176 thiss!1702))) (and (= (currentBit!15087 thiss!1702) #b00000000000000000000000000000000) (= (currentByte!15092 thiss!1702) (size!9034 (buf!8176 thiss!1702)))))))))

(assert (=> b!324132 d!106432))

(declare-fun d!106436 () Bool)

(declare-fun e!233601 () Bool)

(assert (=> d!106436 e!233601))

(declare-fun res!266079 () Bool)

(assert (=> d!106436 (=> (not res!266079) (not e!233601))))

(declare-fun lt!446715 () (_ BitVec 64))

(declare-fun lt!446723 () tuple2!23750)

(declare-fun lt!446717 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> d!106436 (= res!266079 (= (bvadd lt!446717 lt!446715) (bitIndex!0 (size!9034 (buf!8176 (_2!13504 lt!446723))) (currentByte!15092 (_2!13504 lt!446723)) (currentBit!15087 (_2!13504 lt!446723)))))))

(assert (=> d!106436 (or (not (= (bvand lt!446717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446715 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446717 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446717 lt!446715) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106436 (= lt!446715 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106436 (= lt!446717 (bitIndex!0 (size!9034 (buf!8176 thiss!1702)) (currentByte!15092 thiss!1702) (currentBit!15087 thiss!1702)))))

(declare-fun Unit!22076 () Unit!22068)

(declare-fun Unit!22078 () Unit!22068)

