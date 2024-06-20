; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52220 () Bool)

(assert start!52220)

(declare-fun b!240468 () Bool)

(declare-fun e!166673 () Bool)

(declare-datatypes ((array!13151 0))(
  ( (array!13152 (arr!6747 (Array (_ BitVec 32) (_ BitVec 8))) (size!5760 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10442 0))(
  ( (BitStream!10443 (buf!6220 array!13151) (currentByte!11574 (_ BitVec 32)) (currentBit!11569 (_ BitVec 32))) )
))
(declare-fun thiss!982 () BitStream!10442)

(declare-fun array_inv!5501 (array!13151) Bool)

(assert (=> b!240468 (= e!166673 (array_inv!5501 (buf!6220 thiss!982)))))

(declare-fun b!240469 () Bool)

(declare-fun e!166676 () Bool)

(declare-datatypes ((tuple2!20412 0))(
  ( (tuple2!20413 (_1!11128 BitStream!10442) (_2!11128 Bool)) )
))
(declare-fun lt!375572 () tuple2!20412)

(declare-datatypes ((tuple2!20414 0))(
  ( (tuple2!20415 (_1!11129 BitStream!10442) (_2!11129 BitStream!10442)) )
))
(declare-fun lt!375571 () tuple2!20414)

(assert (=> b!240469 (= e!166676 (not (or (not (_2!11128 lt!375572)) (not (= (_1!11128 lt!375572) (_2!11129 lt!375571))))))))

(declare-fun nBits!288 () (_ BitVec 64))

(declare-fun bit!21 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10442 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20412)

(assert (=> b!240469 (= lt!375572 (checkBitsLoopPure!0 (_1!11129 lt!375571) nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!17621 0))(
  ( (Unit!17622) )
))
(declare-datatypes ((tuple2!20416 0))(
  ( (tuple2!20417 (_1!11130 Unit!17621) (_2!11130 BitStream!10442)) )
))
(declare-fun lt!375569 () tuple2!20416)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!240469 (validate_offset_bits!1 ((_ sign_extend 32) (size!5760 (buf!6220 (_2!11130 lt!375569)))) ((_ sign_extend 32) (currentByte!11574 thiss!982)) ((_ sign_extend 32) (currentBit!11569 thiss!982)) nBits!288)))

(declare-fun lt!375573 () Unit!17621)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10442 array!13151 (_ BitVec 64)) Unit!17621)

(assert (=> b!240469 (= lt!375573 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6220 (_2!11130 lt!375569)) nBits!288))))

(declare-fun reader!0 (BitStream!10442 BitStream!10442) tuple2!20414)

(assert (=> b!240469 (= lt!375571 (reader!0 thiss!982 (_2!11130 lt!375569)))))

(declare-fun b!240470 () Bool)

(declare-fun res!200748 () Bool)

(assert (=> b!240470 (=> (not res!200748) (not e!166676))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!240470 (= res!200748 (= (bitIndex!0 (size!5760 (buf!6220 (_2!11130 lt!375569))) (currentByte!11574 (_2!11130 lt!375569)) (currentBit!11569 (_2!11130 lt!375569))) (bvadd (bitIndex!0 (size!5760 (buf!6220 thiss!982)) (currentByte!11574 thiss!982) (currentBit!11569 thiss!982)) nBits!288)))))

(declare-fun b!240471 () Bool)

(declare-fun res!200744 () Bool)

(declare-fun e!166674 () Bool)

(assert (=> b!240471 (=> (not res!200744) (not e!166674))))

(assert (=> b!240471 (= res!200744 (validate_offset_bits!1 ((_ sign_extend 32) (size!5760 (buf!6220 thiss!982))) ((_ sign_extend 32) (currentByte!11574 thiss!982)) ((_ sign_extend 32) (currentBit!11569 thiss!982)) nBits!288))))

(declare-fun b!240473 () Bool)

(assert (=> b!240473 (= e!166674 (not true))))

(assert (=> b!240473 (validate_offset_bits!1 ((_ sign_extend 32) (size!5760 (buf!6220 (_2!11130 lt!375569)))) ((_ sign_extend 32) (currentByte!11574 thiss!982)) ((_ sign_extend 32) (currentBit!11569 thiss!982)) nBits!288)))

(declare-fun lt!375575 () Unit!17621)

(assert (=> b!240473 (= lt!375575 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!982 (buf!6220 (_2!11130 lt!375569)) nBits!288))))

(declare-fun lt!375568 () tuple2!20414)

(assert (=> b!240473 (= lt!375568 (reader!0 thiss!982 (_2!11130 lt!375569)))))

(declare-fun lt!375570 () Bool)

(declare-fun isPrefixOf!0 (BitStream!10442 BitStream!10442) Bool)

(assert (=> b!240473 (= lt!375570 (isPrefixOf!0 thiss!982 (_2!11130 lt!375569)))))

(declare-fun lt!375576 () (_ BitVec 64))

(assert (=> b!240473 (= lt!375576 (bitIndex!0 (size!5760 (buf!6220 (_2!11130 lt!375569))) (currentByte!11574 (_2!11130 lt!375569)) (currentBit!11569 (_2!11130 lt!375569))))))

(declare-fun lt!375574 () (_ BitVec 64))

(assert (=> b!240473 (= lt!375574 (bitIndex!0 (size!5760 (buf!6220 thiss!982)) (currentByte!11574 thiss!982) (currentBit!11569 thiss!982)))))

(assert (=> b!240473 e!166676))

(declare-fun res!200745 () Bool)

(assert (=> b!240473 (=> (not res!200745) (not e!166676))))

(assert (=> b!240473 (= res!200745 (= (size!5760 (buf!6220 thiss!982)) (size!5760 (buf!6220 (_2!11130 lt!375569)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10442 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20416)

(assert (=> b!240473 (= lt!375569 (appendNBitsLoop!0 thiss!982 nBits!288 bit!21 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!240472 () Bool)

(declare-fun res!200746 () Bool)

(assert (=> b!240472 (=> (not res!200746) (not e!166676))))

(assert (=> b!240472 (= res!200746 (isPrefixOf!0 thiss!982 (_2!11130 lt!375569)))))

(declare-fun res!200747 () Bool)

(assert (=> start!52220 (=> (not res!200747) (not e!166674))))

(assert (=> start!52220 (= res!200747 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!288) (bvsle nBits!288 #b0000000000000000000000000000001111111111111111111111111111111000)))))

(assert (=> start!52220 e!166674))

(assert (=> start!52220 true))

(declare-fun inv!12 (BitStream!10442) Bool)

(assert (=> start!52220 (and (inv!12 thiss!982) e!166673)))

(assert (= (and start!52220 res!200747) b!240471))

(assert (= (and b!240471 res!200744) b!240473))

(assert (= (and b!240473 res!200745) b!240470))

(assert (= (and b!240470 res!200748) b!240472))

(assert (= (and b!240472 res!200746) b!240469))

(assert (= start!52220 b!240468))

(declare-fun m!362969 () Bool)

(assert (=> b!240469 m!362969))

(declare-fun m!362971 () Bool)

(assert (=> b!240469 m!362971))

(declare-fun m!362973 () Bool)

(assert (=> b!240469 m!362973))

(declare-fun m!362975 () Bool)

(assert (=> b!240469 m!362975))

(declare-fun m!362977 () Bool)

(assert (=> b!240468 m!362977))

(declare-fun m!362979 () Bool)

(assert (=> start!52220 m!362979))

(declare-fun m!362981 () Bool)

(assert (=> b!240470 m!362981))

(declare-fun m!362983 () Bool)

(assert (=> b!240470 m!362983))

(declare-fun m!362985 () Bool)

(assert (=> b!240471 m!362985))

(assert (=> b!240473 m!362983))

(assert (=> b!240473 m!362971))

(declare-fun m!362987 () Bool)

(assert (=> b!240473 m!362987))

(assert (=> b!240473 m!362975))

(declare-fun m!362989 () Bool)

(assert (=> b!240473 m!362989))

(assert (=> b!240473 m!362973))

(assert (=> b!240473 m!362981))

(assert (=> b!240472 m!362989))

(push 1)

(assert (not b!240471))

(assert (not b!240473))

(assert (not b!240472))

(assert (not b!240468))

(assert (not b!240470))

(assert (not start!52220))

(assert (not b!240469))

(check-sat)

(pop 1)

