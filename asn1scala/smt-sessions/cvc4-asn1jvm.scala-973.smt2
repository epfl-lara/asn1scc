; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27430 () Bool)

(assert start!27430)

(declare-fun b!140812 () Bool)

(declare-fun e!93816 () Bool)

(assert (=> b!140812 (= e!93816 (not true))))

(declare-fun lt!219146 () (_ BitVec 64))

(declare-datatypes ((array!6445 0))(
  ( (array!6446 (arr!3623 (Array (_ BitVec 32) (_ BitVec 8))) (size!2916 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5090 0))(
  ( (BitStream!5091 (buf!3337 array!6445) (currentByte!6197 (_ BitVec 32)) (currentBit!6192 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!8814 0))(
  ( (Unit!8815) )
))
(declare-datatypes ((tuple2!12376 0))(
  ( (tuple2!12377 (_1!6518 Unit!8814) (_2!6518 BitStream!5090)) )
))
(declare-fun lt!219147 () tuple2!12376)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140812 (= lt!219146 (bitIndex!0 (size!2916 (buf!3337 (_2!6518 lt!219147))) (currentByte!6197 (_2!6518 lt!219147)) (currentBit!6192 (_2!6518 lt!219147))))))

(declare-fun e!93814 () Bool)

(assert (=> b!140812 e!93814))

(declare-fun res!117421 () Bool)

(assert (=> b!140812 (=> (not res!117421) (not e!93814))))

(declare-fun thiss!1634 () BitStream!5090)

(assert (=> b!140812 (= res!117421 (= (size!2916 (buf!3337 thiss!1634)) (size!2916 (buf!3337 (_2!6518 lt!219147)))))))

(declare-fun arr!237 () array!6445)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByte!0 (BitStream!5090 (_ BitVec 8)) tuple2!12376)

(assert (=> b!140812 (= lt!219147 (appendByte!0 thiss!1634 (select (arr!3623 arr!237) from!447)))))

(declare-fun res!117417 () Bool)

(assert (=> start!27430 (=> (not res!117417) (not e!93816))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!27430 (= res!117417 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2916 arr!237))))))

(assert (=> start!27430 e!93816))

(assert (=> start!27430 true))

(declare-fun array_inv!2705 (array!6445) Bool)

(assert (=> start!27430 (array_inv!2705 arr!237)))

(declare-fun e!93813 () Bool)

(declare-fun inv!12 (BitStream!5090) Bool)

(assert (=> start!27430 (and (inv!12 thiss!1634) e!93813)))

(declare-fun b!140813 () Bool)

(declare-fun res!117416 () Bool)

(assert (=> b!140813 (=> (not res!117416) (not e!93816))))

(assert (=> b!140813 (= res!117416 (bvslt from!447 to!404))))

(declare-fun b!140814 () Bool)

(assert (=> b!140814 (= e!93813 (array_inv!2705 (buf!3337 thiss!1634)))))

(declare-fun b!140815 () Bool)

(declare-fun res!117415 () Bool)

(assert (=> b!140815 (=> (not res!117415) (not e!93816))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140815 (= res!117415 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2916 (buf!3337 thiss!1634))) ((_ sign_extend 32) (currentByte!6197 thiss!1634)) ((_ sign_extend 32) (currentBit!6192 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140816 () Bool)

(declare-fun res!117420 () Bool)

(assert (=> b!140816 (=> (not res!117420) (not e!93814))))

(assert (=> b!140816 (= res!117420 (= (bitIndex!0 (size!2916 (buf!3337 (_2!6518 lt!219147))) (currentByte!6197 (_2!6518 lt!219147)) (currentBit!6192 (_2!6518 lt!219147))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2916 (buf!3337 thiss!1634)) (currentByte!6197 thiss!1634) (currentBit!6192 thiss!1634)))))))

(declare-datatypes ((tuple2!12378 0))(
  ( (tuple2!12379 (_1!6519 BitStream!5090) (_2!6519 (_ BitVec 8))) )
))
(declare-fun lt!219149 () tuple2!12378)

(declare-fun b!140817 () Bool)

(declare-datatypes ((tuple2!12380 0))(
  ( (tuple2!12381 (_1!6520 BitStream!5090) (_2!6520 BitStream!5090)) )
))
(declare-fun lt!219148 () tuple2!12380)

(assert (=> b!140817 (= e!93814 (and (= (_2!6519 lt!219149) (select (arr!3623 arr!237) from!447)) (= (_1!6519 lt!219149) (_2!6520 lt!219148))))))

(declare-fun readBytePure!0 (BitStream!5090) tuple2!12378)

(assert (=> b!140817 (= lt!219149 (readBytePure!0 (_1!6520 lt!219148)))))

(declare-fun reader!0 (BitStream!5090 BitStream!5090) tuple2!12380)

(assert (=> b!140817 (= lt!219148 (reader!0 thiss!1634 (_2!6518 lt!219147)))))

(declare-fun b!140818 () Bool)

(declare-fun res!117419 () Bool)

(assert (=> b!140818 (=> (not res!117419) (not e!93816))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140818 (= res!117419 (invariant!0 (currentBit!6192 thiss!1634) (currentByte!6197 thiss!1634) (size!2916 (buf!3337 thiss!1634))))))

(declare-fun b!140819 () Bool)

(declare-fun res!117418 () Bool)

(assert (=> b!140819 (=> (not res!117418) (not e!93814))))

(declare-fun isPrefixOf!0 (BitStream!5090 BitStream!5090) Bool)

(assert (=> b!140819 (= res!117418 (isPrefixOf!0 thiss!1634 (_2!6518 lt!219147)))))

(assert (= (and start!27430 res!117417) b!140815))

(assert (= (and b!140815 res!117415) b!140813))

(assert (= (and b!140813 res!117416) b!140818))

(assert (= (and b!140818 res!117419) b!140812))

(assert (= (and b!140812 res!117421) b!140816))

(assert (= (and b!140816 res!117420) b!140819))

(assert (= (and b!140819 res!117418) b!140817))

(assert (= start!27430 b!140814))

(declare-fun m!216629 () Bool)

(assert (=> b!140812 m!216629))

(declare-fun m!216631 () Bool)

(assert (=> b!140812 m!216631))

(assert (=> b!140812 m!216631))

(declare-fun m!216633 () Bool)

(assert (=> b!140812 m!216633))

(assert (=> b!140817 m!216631))

(declare-fun m!216635 () Bool)

(assert (=> b!140817 m!216635))

(declare-fun m!216637 () Bool)

(assert (=> b!140817 m!216637))

(declare-fun m!216639 () Bool)

(assert (=> start!27430 m!216639))

(declare-fun m!216641 () Bool)

(assert (=> start!27430 m!216641))

(assert (=> b!140816 m!216629))

(declare-fun m!216643 () Bool)

(assert (=> b!140816 m!216643))

(declare-fun m!216645 () Bool)

(assert (=> b!140814 m!216645))

(declare-fun m!216647 () Bool)

(assert (=> b!140818 m!216647))

(declare-fun m!216649 () Bool)

(assert (=> b!140815 m!216649))

(declare-fun m!216651 () Bool)

(assert (=> b!140819 m!216651))

(push 1)

(assert (not b!140816))

(assert (not start!27430))

(assert (not b!140815))

(assert (not b!140818))

(assert (not b!140817))

(assert (not b!140819))

(assert (not b!140812))

(assert (not b!140814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

