; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54998 () Bool)

(assert start!54998)

(declare-fun res!215369 () Bool)

(declare-fun e!178137 () Bool)

(assert (=> start!54998 (=> (not res!215369) (not e!178137))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!54998 (= res!215369 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54998 e!178137))

(assert (=> start!54998 true))

(declare-datatypes ((array!13933 0))(
  ( (array!13934 (arr!7098 (Array (_ BitVec 32) (_ BitVec 8))) (size!6111 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11144 0))(
  ( (BitStream!11145 (buf!6633 array!13933) (currentByte!12151 (_ BitVec 32)) (currentBit!12146 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11144)

(declare-fun e!178138 () Bool)

(declare-fun inv!12 (BitStream!11144) Bool)

(assert (=> start!54998 (and (inv!12 thiss!1754) e!178138)))

(declare-fun b!256975 () Bool)

(declare-fun res!215371 () Bool)

(assert (=> b!256975 (=> (not res!215371) (not e!178137))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256975 (= res!215371 (validate_offset_bits!1 ((_ sign_extend 32) (size!6111 (buf!6633 thiss!1754))) ((_ sign_extend 32) (currentByte!12151 thiss!1754)) ((_ sign_extend 32) (currentBit!12146 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256976 () Bool)

(declare-fun res!215370 () Bool)

(assert (=> b!256976 (=> (not res!215370) (not e!178137))))

(assert (=> b!256976 (= res!215370 (not (= from!526 nBits!535)))))

(declare-fun b!256977 () Bool)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256977 (= e!178137 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!6111 (buf!6633 thiss!1754))) ((_ sign_extend 32) (currentByte!12151 thiss!1754)) ((_ sign_extend 32) (currentBit!12146 thiss!1754)))))))

(declare-fun b!256978 () Bool)

(declare-fun array_inv!5852 (array!13933) Bool)

(assert (=> b!256978 (= e!178138 (array_inv!5852 (buf!6633 thiss!1754)))))

(assert (= (and start!54998 res!215369) b!256975))

(assert (= (and b!256975 res!215371) b!256976))

(assert (= (and b!256976 res!215370) b!256977))

(assert (= start!54998 b!256978))

(declare-fun m!386511 () Bool)

(assert (=> start!54998 m!386511))

(declare-fun m!386513 () Bool)

(assert (=> b!256975 m!386513))

(declare-fun m!386515 () Bool)

(assert (=> b!256977 m!386515))

(declare-fun m!386517 () Bool)

(assert (=> b!256978 m!386517))

(push 1)

(assert (not b!256975))

(assert (not start!54998))

(assert (not b!256978))

(assert (not b!256977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86240 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86240 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6111 (buf!6633 thiss!1754))) ((_ sign_extend 32) (currentByte!12151 thiss!1754)) ((_ sign_extend 32) (currentBit!12146 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6111 (buf!6633 thiss!1754))) ((_ sign_extend 32) (currentByte!12151 thiss!1754)) ((_ sign_extend 32) (currentBit!12146 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21809 () Bool)

(assert (= bs!21809 d!86240))

(declare-fun m!386527 () Bool)

(assert (=> bs!21809 m!386527))

(assert (=> b!256975 d!86240))

(declare-fun d!86244 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86244 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12146 thiss!1754) (currentByte!12151 thiss!1754) (size!6111 (buf!6633 thiss!1754))))))

(declare-fun bs!21811 () Bool)

(assert (= bs!21811 d!86244))

(declare-fun m!386529 () Bool)

(assert (=> bs!21811 m!386529))

(assert (=> start!54998 d!86244))

(declare-fun d!86246 () Bool)

(assert (=> d!86246 (= (array_inv!5852 (buf!6633 thiss!1754)) (bvsge (size!6111 (buf!6633 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!256978 d!86246))

(declare-fun d!86248 () Bool)

(assert (=> d!86248 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6111 (buf!6633 thiss!1754))) ((_ sign_extend 32) (currentByte!12151 thiss!1754)) ((_ sign_extend 32) (currentBit!12146 thiss!1754))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6111 (buf!6633 thiss!1754))) ((_ sign_extend 32) (currentByte!12151 thiss!1754)) ((_ sign_extend 32) (currentBit!12146 thiss!1754))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21812 () Bool)

(assert (= bs!21812 d!86248))

(assert (=> bs!21812 m!386527))

(assert (=> b!256977 d!86248))

(push 1)

(assert (not d!86244))

(assert (not d!86248))

(assert (not d!86240))

(check-sat)

(pop 1)

(push 1)

(check-sat)

