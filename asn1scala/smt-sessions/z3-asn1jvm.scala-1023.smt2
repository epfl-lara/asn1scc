; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29316 () Bool)

(assert start!29316)

(declare-fun b!151933 () Bool)

(declare-fun res!127404 () Bool)

(declare-fun e!101544 () Bool)

(assert (=> b!151933 (=> (not res!127404) (not e!101544))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!151933 (= res!127404 (bvsge from!447 to!404))))

(declare-fun res!127402 () Bool)

(assert (=> start!29316 (=> (not res!127402) (not e!101544))))

(declare-datatypes ((array!6775 0))(
  ( (array!6776 (arr!3882 (Array (_ BitVec 32) (_ BitVec 8))) (size!3065 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6775)

(assert (=> start!29316 (= res!127402 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!3065 arr!237))))))

(assert (=> start!29316 e!101544))

(assert (=> start!29316 true))

(declare-fun array_inv!2854 (array!6775) Bool)

(assert (=> start!29316 (array_inv!2854 arr!237)))

(declare-datatypes ((BitStream!5388 0))(
  ( (BitStream!5389 (buf!3562 array!6775) (currentByte!6494 (_ BitVec 32)) (currentBit!6489 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5388)

(declare-fun e!101545 () Bool)

(declare-fun inv!12 (BitStream!5388) Bool)

(assert (=> start!29316 (and (inv!12 thiss!1634) e!101545)))

(declare-fun b!151934 () Bool)

(assert (=> b!151934 (= e!101545 (array_inv!2854 (buf!3562 thiss!1634)))))

(declare-fun b!151935 () Bool)

(declare-fun e!101547 () Bool)

(assert (=> b!151935 (= e!101547 true)))

(declare-datatypes ((tuple2!13524 0))(
  ( (tuple2!13525 (_1!7137 BitStream!5388) (_2!7137 BitStream!5388)) )
))
(declare-fun lt!237963 () tuple2!13524)

(declare-fun reader!0 (BitStream!5388 BitStream!5388) tuple2!13524)

(assert (=> b!151935 (= lt!237963 (reader!0 thiss!1634 thiss!1634))))

(declare-fun b!151936 () Bool)

(declare-fun res!127401 () Bool)

(assert (=> b!151936 (=> (not res!127401) (not e!101544))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!151936 (= res!127401 (validate_offset_bytes!0 ((_ sign_extend 32) (size!3065 (buf!3562 thiss!1634))) ((_ sign_extend 32) (currentByte!6494 thiss!1634)) ((_ sign_extend 32) (currentBit!6489 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!151937 () Bool)

(assert (=> b!151937 (= e!101544 (not e!101547))))

(declare-fun res!127403 () Bool)

(assert (=> b!151937 (=> res!127403 e!101547)))

(declare-fun lt!237962 () (_ BitVec 64))

(assert (=> b!151937 (= res!127403 (not (= lt!237962 (bvadd lt!237962 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!404 from!447)))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!151937 (= lt!237962 (bitIndex!0 (size!3065 (buf!3562 thiss!1634)) (currentByte!6494 thiss!1634) (currentBit!6489 thiss!1634)))))

(declare-fun isPrefixOf!0 (BitStream!5388 BitStream!5388) Bool)

(assert (=> b!151937 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-datatypes ((Unit!9642 0))(
  ( (Unit!9643) )
))
(declare-fun lt!237964 () Unit!9642)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5388) Unit!9642)

(assert (=> b!151937 (= lt!237964 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (= (and start!29316 res!127402) b!151936))

(assert (= (and b!151936 res!127401) b!151933))

(assert (= (and b!151933 res!127404) b!151937))

(assert (= (and b!151937 (not res!127403)) b!151935))

(assert (= start!29316 b!151934))

(declare-fun m!237647 () Bool)

(assert (=> b!151935 m!237647))

(declare-fun m!237649 () Bool)

(assert (=> start!29316 m!237649))

(declare-fun m!237651 () Bool)

(assert (=> start!29316 m!237651))

(declare-fun m!237653 () Bool)

(assert (=> b!151934 m!237653))

(declare-fun m!237655 () Bool)

(assert (=> b!151936 m!237655))

(declare-fun m!237657 () Bool)

(assert (=> b!151937 m!237657))

(declare-fun m!237659 () Bool)

(assert (=> b!151937 m!237659))

(declare-fun m!237661 () Bool)

(assert (=> b!151937 m!237661))

(check-sat (not b!151935) (not b!151934) (not b!151936) (not start!29316) (not b!151937))
