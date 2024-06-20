; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54990 () Bool)

(assert start!54990)

(declare-fun b!256927 () Bool)

(declare-fun res!215335 () Bool)

(declare-fun e!178102 () Bool)

(assert (=> b!256927 (=> (not res!215335) (not e!178102))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!13925 0))(
  ( (array!13926 (arr!7094 (Array (_ BitVec 32) (_ BitVec 8))) (size!6107 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11136 0))(
  ( (BitStream!11137 (buf!6629 array!13925) (currentByte!12147 (_ BitVec 32)) (currentBit!12142 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11136)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!256927 (= res!215335 (validate_offset_bits!1 ((_ sign_extend 32) (size!6107 (buf!6629 thiss!1754))) ((_ sign_extend 32) (currentByte!12147 thiss!1754)) ((_ sign_extend 32) (currentBit!12142 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!256930 () Bool)

(declare-fun e!178100 () Bool)

(declare-fun array_inv!5848 (array!13925) Bool)

(assert (=> b!256930 (= e!178100 (array_inv!5848 (buf!6629 thiss!1754)))))

(declare-fun res!215334 () Bool)

(assert (=> start!54990 (=> (not res!215334) (not e!178102))))

(assert (=> start!54990 (= res!215334 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!54990 e!178102))

(assert (=> start!54990 true))

(declare-fun inv!12 (BitStream!11136) Bool)

(assert (=> start!54990 (and (inv!12 thiss!1754) e!178100)))

(declare-fun b!256928 () Bool)

(declare-fun res!215333 () Bool)

(assert (=> b!256928 (=> (not res!215333) (not e!178102))))

(assert (=> b!256928 (= res!215333 (= from!526 nBits!535))))

(declare-fun b!256929 () Bool)

(assert (=> b!256929 (= e!178102 false)))

(declare-fun lt!398282 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!256929 (= lt!398282 (bitIndex!0 (size!6107 (buf!6629 thiss!1754)) (currentByte!12147 thiss!1754) (currentBit!12142 thiss!1754)))))

(assert (= (and start!54990 res!215334) b!256927))

(assert (= (and b!256927 res!215335) b!256928))

(assert (= (and b!256928 res!215333) b!256929))

(assert (= start!54990 b!256930))

(declare-fun m!386479 () Bool)

(assert (=> b!256927 m!386479))

(declare-fun m!386481 () Bool)

(assert (=> b!256930 m!386481))

(declare-fun m!386483 () Bool)

(assert (=> start!54990 m!386483))

(declare-fun m!386485 () Bool)

(assert (=> b!256929 m!386485))

(check-sat (not b!256929) (not start!54990) (not b!256930) (not b!256927))
