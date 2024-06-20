; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54996 () Bool)

(assert start!54996)

(declare-fun b!256965 () Bool)

(declare-fun e!178129 () Bool)

(declare-datatypes ((array!13931 0))(
  ( (array!13932 (arr!7097 (Array (_ BitVec 32) (_ BitVec 8))) (size!6110 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11142 0))(
  ( (BitStream!11143 (buf!6632 array!13931) (currentByte!12150 (_ BitVec 32)) (currentBit!12145 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11142)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256965 (= e!178129 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!6110 (buf!6632 thiss!1754))) ((_ sign_extend 32) (currentByte!12150 thiss!1754)) ((_ sign_extend 32) (currentBit!12145 thiss!1754)))))))

(declare-fun b!256966 () Bool)

(declare-fun e!178128 () Bool)

(declare-fun array_inv!5851 (array!13931) Bool)

(assert (=> b!256966 (= e!178128 (array_inv!5851 (buf!6632 thiss!1754)))))

(declare-fun b!256964 () Bool)

(declare-fun res!215360 () Bool)

(assert (=> b!256964 (=> (not res!215360) (not e!178129))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!256964 (= res!215360 (not (= from!526 nBits!535)))))

(declare-fun res!215362 () Bool)

(assert (=> start!54996 (=> (not res!215362) (not e!178129))))

(assert (=> start!54996 (= res!215362 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54996 e!178129))

(assert (=> start!54996 true))

(declare-fun inv!12 (BitStream!11142) Bool)

(assert (=> start!54996 (and (inv!12 thiss!1754) e!178128)))

(declare-fun b!256963 () Bool)

(declare-fun res!215361 () Bool)

(assert (=> b!256963 (=> (not res!215361) (not e!178129))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256963 (= res!215361 (validate_offset_bits!1 ((_ sign_extend 32) (size!6110 (buf!6632 thiss!1754))) ((_ sign_extend 32) (currentByte!12150 thiss!1754)) ((_ sign_extend 32) (currentBit!12145 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!54996 res!215362) b!256963))

(assert (= (and b!256963 res!215361) b!256964))

(assert (= (and b!256964 res!215360) b!256965))

(assert (= start!54996 b!256966))

(declare-fun m!386503 () Bool)

(assert (=> b!256965 m!386503))

(declare-fun m!386505 () Bool)

(assert (=> b!256966 m!386505))

(declare-fun m!386507 () Bool)

(assert (=> start!54996 m!386507))

(declare-fun m!386509 () Bool)

(assert (=> b!256963 m!386509))

(check-sat (not b!256966) (not b!256965) (not b!256963) (not start!54996))
(check-sat)
(get-model)

(declare-fun d!86226 () Bool)

(assert (=> d!86226 (= (array_inv!5851 (buf!6632 thiss!1754)) (bvsge (size!6110 (buf!6632 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256966 d!86226))

(declare-fun d!86228 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86228 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6110 (buf!6632 thiss!1754))) ((_ sign_extend 32) (currentByte!12150 thiss!1754)) ((_ sign_extend 32) (currentBit!12145 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6110 (buf!6632 thiss!1754))) ((_ sign_extend 32) (currentByte!12150 thiss!1754)) ((_ sign_extend 32) (currentBit!12145 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21804 () Bool)

(assert (= bs!21804 d!86228))

(declare-fun m!386519 () Bool)

(assert (=> bs!21804 m!386519))

(assert (=> b!256965 d!86228))

(declare-fun d!86230 () Bool)

(assert (=> d!86230 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6110 (buf!6632 thiss!1754))) ((_ sign_extend 32) (currentByte!12150 thiss!1754)) ((_ sign_extend 32) (currentBit!12145 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6110 (buf!6632 thiss!1754))) ((_ sign_extend 32) (currentByte!12150 thiss!1754)) ((_ sign_extend 32) (currentBit!12145 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21805 () Bool)

(assert (= bs!21805 d!86230))

(assert (=> bs!21805 m!386519))

(assert (=> b!256963 d!86230))

(declare-fun d!86233 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86233 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12145 thiss!1754) (currentByte!12150 thiss!1754) (size!6110 (buf!6632 thiss!1754))))))

(declare-fun bs!21807 () Bool)

(assert (= bs!21807 d!86233))

(declare-fun m!386523 () Bool)

(assert (=> bs!21807 m!386523))

(assert (=> start!54996 d!86233))

(check-sat (not d!86228) (not d!86230) (not d!86233))
(check-sat)
