; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29562 () Bool)

(assert start!29562)

(declare-fun b!152594 () Bool)

(declare-fun res!127907 () Bool)

(declare-fun e!102096 () Bool)

(assert (=> b!152594 (=> (not res!127907) (not e!102096))))

(declare-datatypes ((array!6823 0))(
  ( (array!6824 (arr!3906 (Array (_ BitVec 32) (_ BitVec 8))) (size!3083 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5424 0))(
  ( (BitStream!5425 (buf!3586 array!6823) (currentByte!6545 (_ BitVec 32)) (currentBit!6540 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5424)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!152594 (= res!127907 (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!3083 (buf!3586 bs1!10)) (currentByte!6545 bs1!10) (currentBit!6540 bs1!10))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3083 (buf!3586 bs1!10))))))))

(declare-fun b!152597 () Bool)

(declare-fun e!102093 () Bool)

(declare-fun bs2!18 () BitStream!5424)

(declare-fun array_inv!2872 (array!6823) Bool)

(assert (=> b!152597 (= e!102093 (array_inv!2872 (buf!3586 bs2!18)))))

(declare-fun b!152595 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152595 (= e!102096 (not (invariant!0 (currentBit!6540 bs2!18) (currentByte!6545 bs2!18) (size!3083 (buf!3586 bs2!18)))))))

(declare-fun b!152596 () Bool)

(declare-fun e!102092 () Bool)

(assert (=> b!152596 (= e!102092 (array_inv!2872 (buf!3586 bs1!10)))))

(declare-fun res!127908 () Bool)

(assert (=> start!29562 (=> (not res!127908) (not e!102096))))

(assert (=> start!29562 (= res!127908 (= (size!3083 (buf!3586 bs1!10)) (size!3083 (buf!3586 bs2!18))))))

(assert (=> start!29562 e!102096))

(declare-fun inv!12 (BitStream!5424) Bool)

(assert (=> start!29562 (and (inv!12 bs1!10) e!102092)))

(assert (=> start!29562 (and (inv!12 bs2!18) e!102093)))

(assert (= (and start!29562 res!127908) b!152594))

(assert (= (and b!152594 res!127907) b!152595))

(assert (= start!29562 b!152596))

(assert (= start!29562 b!152597))

(declare-fun m!238453 () Bool)

(assert (=> start!29562 m!238453))

(declare-fun m!238455 () Bool)

(assert (=> start!29562 m!238455))

(declare-fun m!238457 () Bool)

(assert (=> b!152595 m!238457))

(declare-fun m!238459 () Bool)

(assert (=> b!152597 m!238459))

(declare-fun m!238461 () Bool)

(assert (=> b!152594 m!238461))

(declare-fun m!238463 () Bool)

(assert (=> b!152596 m!238463))

(check-sat (not start!29562) (not b!152594) (not b!152596) (not b!152595) (not b!152597))
(check-sat)
(get-model)

(declare-fun d!50138 () Bool)

(assert (=> d!50138 (= (array_inv!2872 (buf!3586 bs1!10)) (bvsge (size!3083 (buf!3586 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!152596 d!50138))

(declare-fun d!50142 () Bool)

(assert (=> d!50142 (= (inv!12 bs1!10) (invariant!0 (currentBit!6540 bs1!10) (currentByte!6545 bs1!10) (size!3083 (buf!3586 bs1!10))))))

(declare-fun bs!12260 () Bool)

(assert (= bs!12260 d!50142))

(declare-fun m!238477 () Bool)

(assert (=> bs!12260 m!238477))

(assert (=> start!29562 d!50142))

(declare-fun d!50144 () Bool)

(assert (=> d!50144 (= (inv!12 bs2!18) (invariant!0 (currentBit!6540 bs2!18) (currentByte!6545 bs2!18) (size!3083 (buf!3586 bs2!18))))))

(declare-fun bs!12261 () Bool)

(assert (= bs!12261 d!50144))

(assert (=> bs!12261 m!238457))

(assert (=> start!29562 d!50144))

(declare-fun d!50146 () Bool)

(assert (=> d!50146 (= (array_inv!2872 (buf!3586 bs2!18)) (bvsge (size!3083 (buf!3586 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!152597 d!50146))

(declare-fun d!50150 () Bool)

(declare-fun e!102120 () Bool)

(assert (=> d!50150 e!102120))

(declare-fun res!127932 () Bool)

(assert (=> d!50150 (=> (not res!127932) (not e!102120))))

(declare-fun lt!239109 () (_ BitVec 64))

(declare-fun lt!239107 () (_ BitVec 64))

(declare-fun lt!239105 () (_ BitVec 64))

(assert (=> d!50150 (= res!127932 (= lt!239105 (bvsub lt!239107 lt!239109)))))

